<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "message_outbox".
 *
 * @property integer $id
 * @property string $message_text
 * @property string $time_generated
 * @property string $time_sent
 * @property string $recipient_number
 * @property string $message_status
 * @property boolean $flash_message
 * @property boolean $email_message
 * @property string $email_subject
 * @property string $email_attachment
 */
class MessageOutbox extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'message_outbox';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['message_text', 'recipient_number'], 'required'],
            [['message_text', 'recipient_number', 'message_status', 'email_subject', 'email_attachment'], 'string'],
            [['time_generated', 'time_sent'], 'safe'],
            [['flash_message', 'email_message'], 'boolean']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'message_text' => 'Message Text',
            'time_generated' => 'Time Generated',
            'time_sent' => 'Time Sent',
            'recipient_number' => 'Recipient Number',
            'message_status' => 'Message Status',
            'flash_message' => 'Flash Message',
            'email_message' => 'Email Message',
            'email_subject' => 'Email Subject',
            'email_attachment' => 'Email Attachment',
        ];
    }
}
