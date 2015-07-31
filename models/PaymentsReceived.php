<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "payments_received".
 *
 * @property integer $id
 * @property integer $aggregator
 * @property string $aggregator_transaction_id
 * @property string $vehicle_reference
 * @property string $aggregator_payment_processed_date
 * @property string $date_received
 * @property string $aggregator_payment_reference
 * @property integer $amount
 * @property string $aggregator_memo
 * @property string $payer_mobile
 * @property string $payer_email
 * @property string $payer_name
 * @property string $payment_recon_flag
 * @property string $payment_status
 * @property boolean $sticker_generated
 */
class PaymentsReceived extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'payments_received';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['aggregator', 'aggregator_transaction_id', 'vehicle_reference', 'aggregator_payment_processed_date', 'aggregator_payment_reference', 'amount'], 'required'],
            [['aggregator', 'amount'], 'integer'],
            [['aggregator_transaction_id', 'vehicle_reference', 'aggregator_payment_reference', 'aggregator_memo', 'payer_mobile', 'payer_email', 'payer_name', 'payment_recon_flag', 'payment_status'], 'string'],
            [['aggregator_payment_processed_date', 'date_received'], 'safe'],
            [['sticker_generated'], 'boolean']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'aggregator' => 'Aggregator',
            'aggregator_transaction_id' => 'Aggr Trans ID',
            'vehicle_reference' => 'Vehicle Ref',
            'aggregator_payment_processed_date' => 'Aggr Payment Processed Date',
            'date_received' => 'Date Received',
            'aggregator_payment_reference' => 'Aggr Payment Ref',
            'amount' => 'Amount',
            'aggregator_memo' => 'Aggr Memo',
            'payer_mobile' => 'Payer Mobile',
            'payer_email' => 'Payer Email',
            'payer_name' => 'Payer Name',
            'payment_recon_flag' => 'Payment Recon Flag',
            'payment_status' => 'Payment Status',
            'sticker_generated' => 'Sticker',
        ];
    }

    public function getAggregators()
    {
        return $this->hasOne(PaymentAggregators::className(), ['id' => 'aggregator']);
    }
}
