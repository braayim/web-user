<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\MobileUsers;

/**
 * MobileUsersSearch represents the model behind the search form about `app\models\MobileUsers`.
 */
class MobileUsersSearch extends MobileUsers
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'incorrect_access_count', 'parent_insurance_company'], 'integer'],
            [['phone_number', 'pin', 'name', 'date_created', 'type', 'auth_imsi', 'auth_imei', 'activation_code'], 'safe'],
            [['locked', 'pin_change_flag'], 'boolean'],
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
        $query = MobileUsers::find();

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
            'locked' => $this->locked,
            'incorrect_access_count' => $this->incorrect_access_count,
            'pin_change_flag' => $this->pin_change_flag,
            'parent_insurance_company' => $this->parent_insurance_company,
        ]);

        $query->andFilterWhere(['like', 'phone_number', $this->phone_number])
            ->andFilterWhere(['like', 'pin', $this->pin])
            ->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'type', $this->type])
            ->andFilterWhere(['like', 'auth_imsi', $this->auth_imsi])
            ->andFilterWhere(['like', 'auth_imei', $this->auth_imei])
            ->andFilterWhere(['like', 'activation_code', $this->activation_code]);

        return $dataProvider;
    }
}
