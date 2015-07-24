<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ura_stampduty_prn_registration_details".
 *
 * @property integer $id
 * @property string $vrn
 * @property string $tin
 * @property string $registered_name
 * @property string $amount
 * @property string $prn
 * @property string $date_registered
 * @property integer $payment_id
 * @property string $status
 * @property string $date_pushed_to_bank
 * @property string $date_confirmed
 * @property string $bank_trans_ref
 * @property string $ura_trans_ref
 */
class UraStampdutyPrnReg extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ura_stampduty_prn_registration_details';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['vrn', 'tin', 'registered_name', 'amount', 'prn', 'status', 'bank_trans_ref', 'ura_trans_ref'], 'string'],
            [['date_registered', 'date_pushed_to_bank', 'date_confirmed'], 'safe'],
            [['payment_id'], 'integer'],
            [['payment_id'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'vrn' => 'Vrn',
            'tin' => 'Tin',
            'registered_name' => 'Registered Name',
            'amount' => 'Amount',
            'prn' => 'Prn',
            'date_registered' => 'Date Registered',
            'payment_id' => 'Payment ID',
            'status' => 'Status',
            'date_pushed_to_bank' => 'Date Pushed To Bank',
            'date_confirmed' => 'Date Confirmed',
            'bank_trans_ref' => 'Bank Trans Ref',
            'ura_trans_ref' => 'Ura Trans Ref',
        ];
    }
}
