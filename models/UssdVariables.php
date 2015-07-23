<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ussd_variables".
 *
 * @property string $session_id
 * @property string $phone_number
 * @property string $variable_name
 * @property string $variable_value
 * @property string $time
 */
class UssdVariables extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ussd_variables';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['session_id', 'phone_number', 'variable_name'], 'required'],
            [['time'], 'safe'],
            [['session_id', 'variable_name'], 'string', 'max' => 50],
            [['phone_number'], 'string', 'max' => 20],
            [['variable_value'], 'string', 'max' => 500]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'session_id' => 'Session ID',
            'phone_number' => 'Phone Number',
            'variable_name' => 'Variable Name',
            'variable_value' => 'Variable Value',
            'time' => 'Time',
        ];
    }
}
