<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\MessageOutbox;

/**
 * MessageOutboxSearch represents the model behind the search form about `app\models\MessageOutbox`.
 */
class MessageOutboxSearch extends MessageOutbox
{
    public $searchModel;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['message_text', 'time_generated', 'searchModel', 'time_sent', 'recipient_number', 'message_status', 'email_subject', 'email_attachment'], 'safe'],
            [['flash_message', 'email_message'], 'boolean'],
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
        $query = MessageOutbox::find();

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
            'time_generated' => $this->time_generated,
            'time_sent' => $this->time_sent,
            'flash_message' => $this->flash_message,
            'email_message' => $this->email_message,
        ]);

        $query->orFilterWhere(['ilike', 'message_text', $this->searchModel])
            ->orFilterWhere(['ilike', 'recipient_number', $this->searchModel])
            ->orFilterWhere(['ilike', 'message_status', $this->searchModel])
            ->orFilterWhere(['ilike', 'email_subject', $this->searchModel])
            ->orFilterWhere(['ilike', 'email_attachment', $this->searchModel]);

        return $dataProvider;
    }
}
