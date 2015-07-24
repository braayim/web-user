<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "paid_issued_stickers".
 *
 * @property integer $id
 * @property string $print_code
 * @property string $date_created
 * @property integer $payment_id
 * @property string $expiry_date
 * @property string $vehicle_paid_for
 * @property boolean $printed
 * @property string $printed_by
 * @property string $date_printed
 * @property integer $printer_insurance_company
 * @property string $physical_sticker_serial
 *
 * @property Policies $policies
 */
class PaidIssuedStickers extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'paid_issued_stickers';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['print_code', 'printed_by', 'physical_sticker_serial'], 'string'],
            [['date_created', 'expiry_date', 'date_printed'], 'safe'],
            [['payment_id', 'printer_insurance_company'], 'integer'],
            [['printed'], 'boolean'],
            [['vehicle_paid_for'], 'string', 'max' => 16],
            [['print_code'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'print_code' => 'Print Code',
            'date_created' => 'Date Created',
            'payment_id' => 'Payment ID',
            'expiry_date' => 'Expiry Date',
            'vehicle_paid_for' => 'Vehicle Paid For',
            'printed' => 'Printed',
            'printed_by' => 'Printed By',
            'date_printed' => 'Date Printed',
            'printer_insurance_company' => 'Printer Insurance Company',
            'physical_sticker_serial' => 'Physical Sticker Serial',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPolicies()
    {
        return $this->hasOne(Policies::className(), ['sticker_reference' => 'print_code']);
    }
}
