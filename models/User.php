<?php
namespace app\models;
use Yii;
use yii\base\NotSupportedException;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;
use yii\db\Expression;
use yii\web\IdentityInterface;
use app\models\AuthAssignment;
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
class User extends ActiveRecord implements IdentityInterface
{
    
   public $password2;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%console_users}}';
    }
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::className(),
                'createdAtAttribute' => 'date_created',
                'updatedAtAttribute' => 'updated_at',
                'value' => new Expression('NOW()'),
            ],
        ];
    }
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'fullname', 'mobile_number', 'user_level', 'email_address', 'password', 'password2'], 'required', 'on'=>'create'],
            [['username', 'fullname', 'mobile_number', 'user_level', 'email_address'], 'required', 'on'=>'update'],
            [['password', 'password2'], 'required', 'on'=>'resetPassword'],
            [['username', 'email_address'], 'trim'],
            [['username'], 'unique', 'message'=>'This Username has already been taken'],
            [['email_address'], 'unique', 'message'=>'This user email is already registered'],
            [['email_address'], 'email'],
            [['parent_insurance_company'], 'default'],
            ['password2', 'compare', 'compareAttribute' => 'password'],
            [['locked'], 'boolean'],
            [['password_reset_token', 'auth_key'], 'string', 'max' => 2044],
            
        ];
    }

    public function scenarios()
    {
        $scenarios = parent::scenarios();
        $scenarios['create'] = ['username', 'fullname', 'mobile_number', 'user_level', 'email_address',  'parent_insurance_company','password', 'password2'];

        $scenarios['update'] = ['username', 'fullname', 'mobile_number', 'user_level', 'email_address', 'parent_insurance_company', 'locked'];
        $scenarios['resetPassword'] = ['password', 'password2', 'locked'];
        $scenarios['count'] = ['incorrect_access_count'];
        return $scenarios;
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
            'password' => 'Password',
            'password2' => 'Confirm Password',
            'date_created' => 'Date_created',
            'locked' => 'Locked',
            'user_level' => 'Type of User',
            'parent_insurance_company' => 'Parent Insurance Company',
            'user_permissions' => 'User Permissions',
            'password_reset_token' => 'Password Reset Token',
            'auth_key' => 'Auth Key',
            'updated_at' => 'Updated At',
        ];
    }

    // /**
    //  * @inheritdoc
    //  */
    // public function beforeSave($insert)
    // {
    //     if (parent::beforeSave($insert)) {
    //         if($this->isNewRecord){

    //         } else {

    //         }

    //         return true;
    //     } else {
    //         return false;
    //     }
    // }

    public function setAuthAssignment($role, $id)
    {
        if(!empty($role) && !empty($id)){
            $authAssign = AuthAssignment::find()->where(['user_id'=>$id])->one();
            if($authAssign !== null){
                $authAssign->item_name = $role;
                $authAssign->user_id = $id;
                return $authAssign->save(false);  
            }else 
            {
                $authAssign = new AuthAssignment();
                $authAssign->item_name = $role;
                $authAssign->user_id = $id;
                return $authAssign->save(false);  
            }
        }
        else{
            return false;
        }
        

    }

    public function incorrectLogins($id)
    {
        return static::findOne(['id' => $id, 'locked' => false]);
    }

    /**
     * @inheritdoc
     */
    public static function findIdentity($id)
    {
        return static::findOne(['id' => $id, 'locked' => false]);
    }
    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        throw new NotSupportedException('"findIdentityByAccessToken" is not implemented.');
    }
    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return static::findOne(['username' => $username, 'locked' => false]);
    }
    /**
     * Finds user by password reset token
     *
     * @param string $token password reset token
     * @return static|null
     */
    public static function findByPasswordResetToken($token)
    {
        if (!static::isPasswordResetTokenValid($token)) {
            return null;
        }
        return static::findOne([
            'password_reset_token' => $token,
            'locked' => false,
        ]);
    }
    /**
     * Finds out if password reset token is valid
     *
     * @param string $token password reset token
     * @return boolean
     */
    public static function isPasswordResetTokenValid($token)
    {
        if (empty($token)) {
            return false;
        }
        $expire = Yii::$app->params['user.passwordResetTokenExpire'];
        $parts = explode('_', $token);
        $timestamp = (int) end($parts);
        return $timestamp + $expire >= time();
    }
    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->getPrimaryKey();
    }
    /**
     * @inheritdoc
     */
    public function getAuthKey()
    {
        return $this->auth_key;
    }
    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() === $authKey;
    }
    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return boolean if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return Yii::$app->security->validatePassword($password, $this->password);
    }
    /**
     * Generates password hash from password and sets it to the model
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->password = Yii::$app->security->generatePasswordHash($password);
    }
    /**
     * Generates "remember me" authentication key
     */
    public function generateAuthKey()
    {
        $this->auth_key = Yii::$app->security->generateRandomString();
    }
    /**
     * Generates new password reset token
     */
    public function generatePasswordResetToken()
    {
        $this->password_reset_token = Yii::$app->security->generateRandomString() . '_' . time();
    }
    /**
     * Removes password reset token
     */
    public function removePasswordResetToken()
    {
        $this->password_reset_token = null;
    }
}