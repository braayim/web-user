<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "bulk_upload_files".
 *
 * @property integer $id
 * @property string $description
 * @property string $upload_date
 * @property string $validation_date
 * @property string $process_date
 * @property boolean $is_validated
 * @property boolean $is_processed
 * @property boolean $validation_succeded
 * @property boolean $process_succeeded
 * @property string $validation_comment
 * @property string $process_comment
 * @property integer $created_by
 * @property integer $insurance_company
 * @property string $file_hash
 */
class BulkUploadFiles extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'bulk_upload_files';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['description', 'validation_comment', 'process_comment', 'file_hash'], 'string'],
            [['upload_date', 'validation_date', 'process_date'], 'safe'],
            [['is_validated', 'is_processed', 'validation_succeded', 'process_succeeded'], 'boolean'],
            [['created_by', 'insurance_company'], 'integer']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'description' => 'Description',
            'upload_date' => 'Upload Date',
            'validation_date' => 'Validation Date',
            'process_date' => 'Process Date',
            'is_validated' => 'Is Validated',
            'is_processed' => 'Is Processed',
            'validation_succeded' => 'Validation Succeded',
            'process_succeeded' => 'Process Succeeded',
            'validation_comment' => 'Validation Comment',
            'process_comment' => 'Process Comment',
            'created_by' => 'Created By',
            'insurance_company' => 'Insurance Company',
            'file_hash' => 'File Hash',
        ];
    }
}
