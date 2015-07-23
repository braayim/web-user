<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\UraStampdutyPrnReg;

/**
 * UraStampdutyPrnRegSearch represents the model behind the search form about `app\models\UraStampdutyPrnReg`.
 */
class UraStampdutyPrnRegSearch extends UraStampdutyPrnReg
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'payment_id'], 'integer'],
            [['vrn', 'tin', 'registered_name', 'amount', 'prn', 'date_registered', 'status', 'date_pushed_to_bank', 'date_confirmed', 'bank_trans_ref', 'ura_trans_ref'], 'safe'],
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
        $query = UraStampdutyPrnReg::find();

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
            'date_registered' => $this->date_registered,
            'payment_id' => $this->payment_id,
            'date_pushed_to_bank' => $this->date_pushed_to_bank,
            'date_confirmed' => $this->date_confirmed,
        ]);

        $query->andFilterWhere(['like', 'vrn', $this->vrn])
            ->andFilterWhere(['like', 'tin', $this->tin])
            ->andFilterWhere(['like', 'registered_name', $this->registered_name])
            ->andFilterWhere(['like', 'amount', $this->amount])
            ->andFilterWhere(['like', 'prn', $this->prn])
            ->andFilterWhere(['like', 'status', $this->status])
            ->andFilterWhere(['like', 'bank_trans_ref', $this->bank_trans_ref])
            ->andFilterWhere(['like', 'ura_trans_ref', $this->ura_trans_ref]);

        return $dataProvider;
    }
}
