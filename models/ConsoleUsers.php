<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "console_users".
 *
 * @property integer $id
 * @property string $username
 * @property string $fullname
 * @property string $mobile_number
 * @property string $email_address
 * @property integer $incorrect_access_count
 * @property string $password
 * @property string $date_created
 * @property boolean $locked
 * @property string $user_level
 * @property integer $parent_insurance_company
 * @property string $user_permissions
 */
class ConsoleUsers extends \yii\db\ActiveRecord
{
    public $password2;
    const INSU_COMP_USER = 1;
    const NEON =2;
    const URA =3;
    const ADMIN = 4; 
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'console_users';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'fullname', 'mobile_number', 'email_address'], 'required'],
            [['username', 'fullname', 'mobile_number', 'email_address', 'password', 'password2', 'user_level', 'user_permissions'], 'string'],
            [['incorrect_access_count', 'parent_insurance_company'], 'integer'],
            [['date_created'], 'safe'],
            [['locked'], 'boolean'],
            [['username'], 'unique']
        ];
    }

    public function confirm_password(){

    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Username',
            'fullname' => 'Fullname',
            'mobile_number' => 'Mobile Number',
            'email_address' => 'Email Address',
            'incorrect_access_count' => 'Incorrect Access Count',
            'password' => 'Create Password',
            'password2' => 'Confirm Password',
            'locked' => 'Locked',
            'user_level' => 'User Type',
            'parent_insurance_company' => 'Insurance Company',
            'user_permissions' => 'User Permissions',
        ];
    }

    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            if(Yii::$app->user->isGuest){
                $this->date_created = date("Ymd");
                $this->password = $this->encrypt($this->password);
            }
            return true;
        } else {
            return false;
        }
    }

    private function encrypt($value)
    {
        $passwordhash = sha1();
    }

}
