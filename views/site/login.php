<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\LoginForm */
$this->title = 'Login';
?>

<div class="site-login">
<div class="login-box">
    <div class="login-logo">
        <b>Web</b>USER
      </div><!-- /.login-logo -->

        <div class="login-box-body">
            <p class="login-box-msg">Sign in to start your session</p>

            <?php $form = ActiveForm::begin(['id' => 'login-form' ]); ?>

            <?= $form->field($model, 'username', ['options'=>[
                        'class'=>'form-group field-loginform-username has-feedback required'
                        ],
                        'template'=>'{input}<span class="glyphicon glyphicon-user form-control-feedback"></span>
                                    {error}{hint}'
                         ])->textInput(['placeholder'=>'Username']) ?>

            <?= $form->field($model, 'password')->passwordInput() ?>

            <?= $form->field($model, 'rememberMe')->checkbox() ?>

            <div class="form-group">
                    <?= Html::submitButton('Login', ['class' => 'btn btn-primary', 'name' => 'login-button']) ?>
            </div>
       <?php ActiveForm::end(); ?>
    </div>
</div>
 </div>