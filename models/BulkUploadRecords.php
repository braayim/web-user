<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "bulk_upload_records".
 *
 * @property integer $id
 * @property integer $file_id
 * @property string $reg_no
 * @property string $payer_phone
 * @property string $payer_email
 * @property string $policy_number
 * @property string $policy_start_date
 * @property string $policy_end_date
 * @property integer $assessment_amount
 * @property boolean $processed
 * @property string $process_comment
 */
class BulkUploadRecords extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'bulk_upload_records';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['file_id', 'reg_no'], 'required'],
            [['file_id', 'assessment_amount'], 'integer'],
            [['reg_no', 'payer_phone', 'payer_email', 'policy_number', 'process_comment'], 'string'],
            [['policy_start_date', 'policy_end_date'], 'safe'],
            [['processed'], 'boolean']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'file_id' => 'File ID',
            'reg_no' => 'Reg No',
            'payer_phone' => 'Payer Phone',
            'payer_email' => 'Payer Email',
            'policy_number' => 'Policy Number',
            'policy_start_date' => 'Policy Start Date',
            'policy_end_date' => 'Policy End Date',
            'assessment_amount' => 'Assessment Amount',
            'processed' => 'Processed',
            'process_comment' => 'Process Comment',
        ];
    }
}
