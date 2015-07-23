<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "payment_aggregators".
 *
 * @property integer $id
 * @property string $name
 * @property string $access_code
 * @property string $access_password
 * @property string $security_code
 * @property boolean $active
 * @property string $date_created
 * @property integer $incorrect_access_count
 * @property boolean $locked
 * @property string $email_address
 */
class PaymentAggregators extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'payment_aggregators';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'access_code', 'access_password', 'security_code'], 'required'],
            [['name', 'access_code', 'access_password', 'security_code', 'email_address'], 'string'],
            [['active', 'locked'], 'boolean'],
            [['date_created'], 'safe'],
            [['incorrect_access_count'], 'integer']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'access_code' => 'Access Code',
            'access_password' => 'Access Password',
            'security_code' => 'Security Code',
            'active' => 'Active',
            'date_created' => 'Date Created',
            'incorrect_access_count' => 'Incorrect Access Count',
            'locked' => 'Locked',
            'email_address' => 'Email Address',
        ];
    }
}
