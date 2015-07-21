<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "console_user_groups".
 *
 * @property integer $id
 * @property string $group_name
 * @property string $group_roles
 * @property string $date_added
 */
class ConsoleUserGroups extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'console_user_groups';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['group_name', 'group_roles'], 'string'],
            [['date_added'], 'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'group_name' => 'Group Name',
            'group_roles' => 'Group Roles',
            'date_added' => 'Date Added',
        ];
    }
}
