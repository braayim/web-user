<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "inbox".
 *
 * @property integer $id
 * @property string $sender
 * @property string $recipient
 * @property string $date_received
 * @property string $message_text
 * @property boolean $read
 * @property string $recipient_type
 */
class Inbox extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'inbox';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['sender', 'recipient', 'message_text', 'recipient_type'], 'string'],
            [['date_received'], 'safe'],
            [['read'], 'boolean']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'sender' => 'Sender',
            'recipient' => 'Recipient',
            'date_received' => 'Date Received',
            'message_text' => 'Message Text',
            'read' => 'Read',
            'recipient_type' => 'Recipient Type',
        ];
    }
}
