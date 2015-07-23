<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\UraFirstimeReg;

/**
 * UraFirstimeRegSearch represents the model behind the search form about `app\models\UraFirstimeReg`.
 */
class UraFirstimeRegSearch extends UraFirstimeReg
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'gross_weight', 'seating_capacity', 'payment_id'], 'integer'],
            [['registration_number', 'registration_name', 'registration_date', 'date_created', 'date_registered', 'engine_capacity', 'memo', 'model', 'type', 'purpose', 'engine_number', 'colour', 'make', 'tyre_size', 'year_of_manufacture', 'chassis_number', 'tin', 'date_transacted'], 'safe'],
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

        $query->andFilterWhere(['like', 'registration_number', $this->registration_number])
            ->andFilterWhere(['like', 'registration_name', $this->registration_name])
            ->andFilterWhere(['like', 'engine_capacity', $this->engine_capacity])
            ->andFilterWhere(['like', 'memo', $this->memo])
            ->andFilterWhere(['like', 'model', $this->model])
            ->andFilterWhere(['like', 'type', $this->type])
            ->andFilterWhere(['like', 'purpose', $this->purpose])
            ->andFilterWhere(['like', 'engine_number', $this->engine_number])
            ->andFilterWhere(['like', 'colour', $this->colour])
            ->andFilterWhere(['like', 'make', $this->make])
            ->andFilterWhere(['like', 'tyre_size', $this->tyre_size])
            ->andFilterWhere(['like', 'chassis_number', $this->chassis_number])
            ->andFilterWhere(['like', 'tin', $this->tin]);

        return $dataProvider;
    }
}
