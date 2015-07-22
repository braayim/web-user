<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "policies".
 *
 * @property integer $id
 * @property string $date_created
 * @property string $start_date
 * @property string $end_date
 * @property string $registration_number
 * @property string $policy_holder_name
 * @property string $policy_holder_phone
 * @property string $policy_number
 * @property integer $insurance_company
 * @property string $sticker_reference
 *
 * @property InsuranceCompanies $insuranceCompany
 * @property PaidIssuedStickers $stickerReference
 */
class Policies extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'policies';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['date_created', 'start_date', 'end_date'], 'safe'],
            [['registration_number', 'policy_holder_name', 'policy_holder_phone', 'policy_number', 'sticker_reference'], 'string'],
            [['insurance_company'], 'integer'],
            [['sticker_reference'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'date_created' => 'Date Created',
            'start_date' => 'Start Date',
            'end_date' => 'End Date',
            'registration_number' => 'Reg No',
            'policy_holder_name' => 'PH Name',
            'policy_holder_phone' => 'PH Phone',
            'policy_number' => 'Policy Number',
            'insurance_company' => 'Insurance Company',
            'sticker_reference' => 'Sticker Reference',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInsuranceCompany()
    {
        return $this->hasOne(InsuranceCompanies::className(), ['id' => 'insurance_company']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStickerReference()
    {
        return $this->hasOne(PaidIssuedStickers::className(), ['print_code' => 'sticker_reference']);
    }
}
