<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "motor_entity_details".
 *
 * @property integer $id
 * @property string $registration_number
 * @property string $registration_name
 * @property string $registration_date
 * @property string $date_created
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
 */
class MotorEntityDetails extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'motor_entity_details';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['registration_number'], 'required'],
            [['registration_number', 'registration_name', 'engine_capacity', 'memo', 'model', 'type', 'purpose', 'engine_number', 'colour', 'make', 'tyre_size', 'chassis_number', 'tin'], 'string'],
            [['registration_date', 'date_created', 'year_of_manufacture'], 'safe'],
            [['gross_weight', 'seating_capacity'], 'integer'],
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
        ];
    }
}
