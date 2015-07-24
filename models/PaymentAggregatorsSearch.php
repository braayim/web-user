<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\PaymentAggregators;

/**
 * PaymentAggregatorsSearch represents the model behind the search form about `app\models\PaymentAggregators`.
 */
class PaymentAggregatorsSearch extends PaymentAggregators
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'incorrect_access_count'], 'integer'],
            [['name', 'access_code', 'access_password', 'security_code', 'date_created', 'email_address'], 'safe'],
            [['active', 'locked'], 'boolean'],
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
        $query = PaymentAggregators::find();

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
            'active' => $this->active,
            'date_created' => $this->date_created,
            'incorrect_access_count' => $this->incorrect_access_count,
            'locked' => $this->locked,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'access_code', $this->access_code])
            ->andFilterWhere(['like', 'access_password', $this->access_password])
            ->andFilterWhere(['like', 'security_code', $this->security_code])
            ->andFilterWhere(['like', 'email_address', $this->email_address]);

        return $dataProvider;
    }
}
