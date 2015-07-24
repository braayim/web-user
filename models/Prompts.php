<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "prompts".
 *
 * @property integer $id
 * @property string $description
 * @property string $next_type
 * @property integer $next_id
 * @property boolean $is_leaf
 * @property integer $application_id
 * @property string $data_template
 * @property string $variable_name
 * @property string $continue_data_template
 * @property boolean $is_confirmation
 * @property boolean $is_account_prompt
 * @property boolean $is_auth
 */
class Prompts extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'prompts';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['description'], 'required'],
            [['description', 'next_type', 'data_template', 'variable_name', 'continue_data_template'], 'string'],
            [['next_id', 'application_id'], 'integer'],
            [['is_leaf', 'is_confirmation', 'is_account_prompt', 'is_auth'], 'boolean']
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
            'next_type' => 'Next Type',
            'next_id' => 'Next ID',
            'is_leaf' => 'Is Leaf',
            'application_id' => 'Application ID',
            'data_template' => 'Data Template',
            'variable_name' => 'Variable Name',
            'continue_data_template' => 'Continue Data Template',
            'is_confirmation' => 'Is Confirmation',
            'is_account_prompt' => 'Is Account Prompt',
            'is_auth' => 'Is Auth',
        ];
    }
}
