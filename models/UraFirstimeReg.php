<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ura_first_time_registration_details".
 *
 * @property integer $id
 * @property string $registration_number
 * @property string $registration_name
 * @property string $registration_date
 * @property string $date_created
 * @property string $date_registered
 * @property string $engine_capacity
 * @property string $memo
 * @property string $model
 * @property string $type
 * @property integer $gross_weight
 * @property integer $seating_capacity
 * @property string $purpose
 * @property string $engine_number
 * @property string $colour
 * @property string $make
 * @property string $tyre_size
 * @property string $year_of_manufacture
 * @property string $chassis_number
 * @property string $tin
 * @property boolean $transacted
 * @property string $date_transacted
 * @property integer $payment_id
 */
class UraFirstimeReg extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ura_first_time_registration_details';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['registration_number'], 'required'],
            [['registration_number', 'registration_name', 'engine_capacity', 'memo', 'model', 'type', 'purpose', 'engine_number', 'colour', 'make', 'tyre_size', 'chassis_number', 'tin'], 'string'],
            [['registration_date', 'date_created', 'date_registered', 'year_of_manufacture', 'date_transacted'], 'safe'],
            [['gross_weight', 'seating_capacity', 'payment_id'], 'integer'],
            [['transacted'], 'boolean'],
            [['registration_number'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'registration_number' => 'Registration Number',
            'registration_name' => 'Registration Name',
            'registration_date' => 'Registration Date',
            'date_created' => 'Date Created',
            'date_registered' => 'Date Registered',
            'engine_capacity' => 'Engine Capacity',
            'memo' => 'Memo',
            'model' => 'Model',
            'type' => 'Type',
            'gross_weight' => 'Gross Weight',
            'seating_capacity' => 'Seating Capacity',
            'purpose' => 'Purpose',
            'engine_number' => 'Engine Number',
            'colour' => 'Colour',
            'make' => 'Make',
            'tyre_size' => 'Tyre Size',
            'year_of_manufacture' => 'Year Of Manufacture',
            'chassis_number' => 'Chassis Number',
            'tin' => 'Tin',
            'transacted' => 'Transacted',
            'date_transacted' => 'Date Transacted',
            'payment_id' => 'Payment ID',
        ];
    }
}
