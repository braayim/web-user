<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "insurance_companies".
 *
 * @property integer $id
 * @property string $code
 * @property string $description
 * @property string $address
 * @property string $email_address
 *
 * @property Policies[] $policies
 */
class InsuranceCompanies extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'insurance_companies';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['code', 'description', 'address', 'email_address'], 'string']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'code' => 'Code',
            'description' => 'Description',
            'address' => 'Address',
            'email_address' => 'Email Address',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPolicies()
    {
        return $this->hasMany(Policies::className(), ['insurance_company' => 'id']);
    }
}
