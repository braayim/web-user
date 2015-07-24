<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ussd_sessions".
 *
 * @property integer $id
 * @property string $phone_number
 * @property string $session_id
 * @property string $time
 * @property string $status
 * @property string $status_type
 * @property string $root_menu_id
 * @property string $last_menu_id
 * @property integer $leaf_state
 */
class UssdSessions extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ussd_sessions';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['phone_number', 'session_id'], 'required'],
            [['time'], 'safe'],
            [['status_type'], 'string'],
            [['leaf_state'], 'integer'],
            [['phone_number'], 'string', 'max' => 20],
            [['session_id'], 'string', 'max' => 50],
            [['status'], 'string', 'max' => 15],
            [['root_menu_id', 'last_menu_id'], 'string', 'max' => 32],
            [['phone_number', 'session_id'], 'unique', 'targetAttribute' => ['phone_number', 'session_id'], 'message' => 'The combination of Phone Number and Session ID has already been taken.']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'phone_number' => 'Phone Number',
            'session_id' => 'Session ID',
            'time' => 'Time',
            'status' => 'Status',
            'status_type' => 'Status Type',
            'root_menu_id' => 'Root Menu ID',
            'last_menu_id' => 'Last Menu ID',
            'leaf_state' => 'Leaf State',
        ];
    }
}
