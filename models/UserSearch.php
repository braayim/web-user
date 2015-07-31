<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\User;

if (!Yii::$app->session->isActive){
          session_start();  
      }

/**
 * ConsoleUsersSearch represents the model behind the search form about `app\models\ConsoleUsers`.
 */
class UserSearch extends User
{
    public $modelSearch;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'incorrect_access_count', 'parent_insurance_company'], 'integer'],
            [['username', 'fullname', 'mobile_number', 'email_address', 'modelSearch', 'password', 'date_created', 'user_level', 'user_permissions'], 'safe'],
            [['locked'], 'boolean'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {

        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = User::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['pageSize' => 15,],
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'incorrect_access_count' => $this->incorrect_access_count,
            'date_created' => $this->date_created,
            'locked' => $this->locked,
            'parent_insurance_company' => $this->parent_insurance_company,
        ]);

        $query->orFilterWhere(['ilike', 'username', $this->modelSearch])
            ->orFilterWhere(['ilike', 'fullname', $this->modelSearch])
            ->orFilterWhere(['ilike', 'mobile_number', $this->modelSearch])
            ->orFilterWhere(['ilike', 'email_address', $this->modelSearch])
            ->orFilterWhere(['ilike', 'password', $this->modelSearch])
            ->orFilterWhere(['ilike', 'user_level', $this->modelSearch])
            ->orFilterWhere(['ilike', 'user_permissions', $this->modelSearch]);

        unset($_SESSION['exportData']);
        $_SESSION['exportData'] = $dataProvider;

        return $dataProvider;
    }

    public static function getExportData() 
    {
    $data = [
            'data'=>$_SESSION['exportData'],
            'fileName'=>'console-users', 
            'title'=>'Users Datasheet',
            'exportFile'=>'/user/exportPdfExcel',
        ];

    return $data;
    }
}
