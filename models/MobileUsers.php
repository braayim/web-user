<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "mobile_users".
 *
 * @property integer $id
 * @property string $phone_number
 * @property string $pin
 * @property string $name
 * @property string $date_created
 * @property boolean $locked
 * @property string $type
 * @property integer $incorrect_access_count
 * @property boolean $pin_change_flag
 * @property integer $parent_insurance_company
 * @property string $auth_imsi
 * @property string $auth_imei
 * @property string $activation_code
 */
class MobileUsers extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'mobile_users';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['phone_number', 'pin', 'name', 'type', 'auth_imsi', 'auth_imei', 'activation_code'], 'string'],
            [['date_created'], 'safe'],
            [['locked', 'pin_change_flag'], 'boolean'],
            [['incorrect_access_count', 'parent_insurance_company'], 'integer'],
            [['phone_number'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'phone_number' => 'Phone Number',
            'pin' => 'Pin',
            'name' => 'Name',
            'date_created' => 'Date Created',
            'locked' => 'Locked',
            'type' => 'Type',
            'incorrect_access_count' => 'Incorrect Access Count',
            'pin_change_flag' => 'Pin Change Flag',
            'parent_insurance_company' => 'Parent Insurance Company',
            'auth_imsi' => 'Auth Imsi',
            'auth_imei' => 'Auth Imei',
            'activation_code' => 'Activation Code',
        ];
    }
}
