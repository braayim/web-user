<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "message_templates".
 *
 * @property string $id
 * @property string $message_template
 */
class MessageTemplates extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'message_templates';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'message_template'], 'required'],
            [['id', 'message_template'], 'string']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'message_template' => 'Message Template',
        ];
    }
}
