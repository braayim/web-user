<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\UraFirstimeReg;

session_start();

/**
 * UraFirstimeRegSearch represents the model behind the search form about `app\models\UraFirstimeReg`.
 */
class UraFirstimeRegSearch extends UraFirstimeReg
{
    
    public $modelSearch;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'gross_weight', 'seating_capacity', 'payment_id'], 'integer'],
            [['registration_number', 'registration_name', 'modelSearch', 'registration_date', 'date_created', 'date_registered', 'engine_capacity', 'memo', 'model', 'type', 'purpose', 'engine_number', 'colour', 'make', 'tyre_size', 'year_of_manufacture', 'chassis_number', 'tin', 'date_transacted'], 'safe'],
            [['transacted'], 'boolean'],
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
        $query = UraFirstimeReg::find();

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
            'registration_date' => $this->registration_date,
            'date_created' => $this->date_created,
            'date_registered' => $this->date_registered,
            'gross_weight' => $this->gross_weight,
            'seating_capacity' => $this->seating_capacity,
            'year_of_manufacture' => $this->year_of_manufacture,
            'transacted' => $this->transacted,
            'date_transacted' => $this->date_transacted,
            'payment_id' => $this->payment_id,
        ]);

        $query->orFilterWhere(['ilike', 'registration_number', $this->modelSearch])
            ->orFilterWhere(['ilike', 'registration_name', $this->modelSearch])
            ->orFilterWhere(['ilike', 'engine_capacity', $this->modelSearch])
            ->orFilterWhere(['ilike', 'memo', $this->modelSearch])
            ->orFilterWhere(['ilike', 'model', $this->modelSearch])
            ->orFilterWhere(['ilike', 'type', $this->modelSearch])
            ->orFilterWhere(['ilike', 'purpose', $this->modelSearch])
            ->orFilterWhere(['ilike', 'engine_number', $this->modelSearch])
            ->orFilterWhere(['ilike', 'colour', $this->modelSearch])
            ->orFilterWhere(['ilike', 'make', $this->modelSearch])
            ->orFilterWhere(['ilike', 'tyre_size', $this->modelSearch])
            ->orFilterWhere(['ilike', 'chassis_number', $this->modelSearch])
            ->orFilterWhere(['ilike', 'tin', $this->modelSearch]);

      unset($_SESSION['exportData']);
    $_SESSION['exportData'] = $dataProvider;

        return $dataProvider;
    }

    public static function getExportData() 
    {
    $data = [
            'data'=>$_SESSION['exportData'],
            'fileName'=>'ura_first_time_reg', 
            'title'=>'URA First Time Registration',
            'exportFile'=>'/ura-firstime-reg/exportPdfExcel',
        ];

    return $data;
    }
}
