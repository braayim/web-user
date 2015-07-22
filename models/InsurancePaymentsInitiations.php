<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "insurance_payments_initiations".
 *
 * @property integer $id
 * @property string $transaction_id
 * @property string $vehicle_reference
 * @property string $processed_date
 * @property integer $amount
 * @property string $payer_mobile
 * @property string $policy_number
 * @property string $vehicle_description
 * @property string $payer_email
 * @property string $payer_name
 * @property string $status
 * @property integer $insurance_company_profile
 * @property integer $initiated_by
 * @property integer $approved_by
 * @property string $date_approved
 * @property string $policy_start_date
 * @property string $policy_end_date
 */
class InsurancePaymentsInitiations extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'insurance_payments_initiations';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['transaction_id', 'vehicle_reference', 'processed_date', 'amount'], 'required'],
            [['transaction_id', 'vehicle_reference', 'payer_mobile', 'policy_number', 'vehicle_description', 'payer_email', 'payer_name', 'status'], 'string'],
            [['processed_date', 'date_approved', 'policy_start_date', 'policy_end_date'], 'safe'],
            [['amount', 'insurance_company_profile', 'initiated_by', 'approved_by'], 'integer']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'transaction_id' => 'Transaction ID',
            'vehicle_reference' => 'Vehicle Reference',
            'processed_date' => 'Processed Date',
            'amount' => 'Amount',
            'payer_mobile' => 'Payer Mobile',
            'policy_number' => 'Policy Number',
            'vehicle_description' => 'Vehicle Description',
            'payer_email' => 'Payer Email',
            'payer_name' => 'Payer Name',
            'status' => 'Status',
            'insurance_company_profile' => 'Insurance Company Profile',
            'initiated_by' => 'Initiated By',
            'approved_by' => 'Approved By',
            'date_approved' => 'Date Approved',
            'policy_start_date' => 'Policy Start Date',
            'policy_end_date' => 'Policy End Date',
        ];
    }
}
