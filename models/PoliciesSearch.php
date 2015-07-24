<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Policies;

session_start();
/**
 * PoliciesSearch represents the model behind the search form about `app\models\Policies`.
 */
class PoliciesSearch extends Policies
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'insurance_company'], 'integer'],
            [['date_created', 'start_date', 'end_date', 'registration_number', 'policy_holder_name', 'policy_holder_phone', 'policy_number', 'sticker_reference'], 'safe'],
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
        $query = Policies::find();

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
            'date_created' => $this->date_created,
            'start_date' => $this->start_date,
            'end_date' => $this->end_date,
            'insurance_company' => $this->insurance_company,
        ]);

        $query->andFilterWhere(['ilike', 'registration_number', $this->registration_number])
            ->andFilterWhere(['ilike', 'policy_holder_name', $this->policy_holder_name])
            ->andFilterWhere(['ilike', 'policy_holder_phone', $this->policy_holder_phone])
            ->andFilterWhere(['ilike', 'policy_number', $this->policy_number])
            ->andFilterWhere(['like', 'sticker_reference', $this->sticker_reference]);

     unset($_SESSION['exportData']);
    $_SESSION['exportData'] = $dataProvider;

        return $dataProvider;
    }

    public static function getExportData() 
    {
    $data = [
            'data'=>$_SESSION['exportData'],
            'fileName'=>'Insurance-companies', 
            'title'=>'Insurance Companies',
            'exportFile'=>'/policies/exportPdfExcel',
        ];

    return $data;
    }
}
