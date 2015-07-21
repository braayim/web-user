<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\ConsoleUsers;

/**
 * ConsoleUsersSearch represents the model behind the search form about `app\models\ConsoleUsers`.
 */
class ConsoleUsersSearch extends ConsoleUsers
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'incorrect_access_count', 'parent_insurance_company'], 'integer'],
            [['username', 'fullname', 'mobile_number', 'email_address', 'password', 'date_created', 'user_level', 'user_permissions'], 'safe'],
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
        $query = ConsoleUsers::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
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

        $query->andFilterWhere(['like', 'username', $this->username])
            ->andFilterWhere(['like', 'fullname', $this->fullname])
            ->andFilterWhere(['like', 'mobile_number', $this->mobile_number])
            ->andFilterWhere(['like', 'email_address', $this->email_address])
            ->andFilterWhere(['like', 'password', $this->password])
            ->andFilterWhere(['like', 'user_level', $this->user_level])
            ->andFilterWhere(['like', 'user_permissions', $this->user_permissions]);

        return $dataProvider;
    }
}
