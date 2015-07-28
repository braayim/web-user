<?php
namespace app\models;

use app\models\ConsoleUsers;
use yii\base\Model;
use Yii;

/**
 * Signup form
 */
class SignupForm extends Model
{
    public $fullname;
    public $username;
    public $mobile_number;
    public $email_address;
    public $password;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['username', 'filter', 'filter' => 'trim'],
            ['username', 'required'],
            ['username', 'unique', 'targetClass' => '\app\models\ConsoleUsers', 'message' => 'This username has already been taken.'],
            ['username', 'string', 'min' => 2, 'max' => 255],

            ['email_address', 'filter', 'filter' => 'trim'],
            ['email_address', 'required'],
            ['fullname', 'required', 'message'=>'Have to provide your Full name'],
            ['email_address', 'email'],
            ['email_address', 'unique', 'targetClass' => '\app\models\ConsoleUsers', 'message' => 'This email address has already been taken.'],

            ['password', 'required'],
            ['password', 'string', 'min' => 6],
        ];
    }

    /**
     * Signs user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function signup()
    {
        if ($this->validate()) {
            $user = new ConsoleUsers();
            $user->username = $this->username;
            $user->fullname=$this->fullname;
            $user->mobile_number=$this->mobile_number;
            $user->email_address = $this->email_address;
            $user->setPassword($this->password);
            $user->generateAuthKey();
            if ($user->save()) {
                return $user;
            }
        }

        return null;
    }
}
