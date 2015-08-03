<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Inbox;

/**
 * InboxSearch represents the model behind the search form about `app\models\Inbox`.
 */
class InboxSearch extends Inbox
{
    
    public $searchModel;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['sender', 'recipient', 'date_received', 'searchModel', 'message_text', 'recipient_type'], 'safe'],
            [['read'], 'boolean'],
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
        $query = Inbox::find();

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
            'date_received' => $this->date_received,
            'read' => $this->read,
        ]);

        $query->orFilterWhere(['ilike', 'sender', $this->searchModel])
            ->orFilterWhere(['ilike', 'recipient', $this->searchModel])
            ->orFilterWhere(['ilike', 'message_text', $this->searchModel])
            ->orFilterWhere(['ilike', 'recipient_type', $this->searchModel]);

        return $dataProvider;
    }
}
