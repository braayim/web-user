<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "web_log".
 *
 * @property integer $id
 * @property string $username
 * @property string $date
 * @property string $action
 * @property string $result
 * @property string $parameters
 */
class WebLog extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'web_log';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'action', 'result', 'parameters'], 'string'],
            [['date'], 'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Username',
            'date' => 'Date',
            'action' => 'Action',
            'result' => 'Result',
            'parameters' => 'Parameters',
        ];
    }
}
