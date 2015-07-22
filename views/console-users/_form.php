<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use app\models\InsuranceCompanies;

/* @var $this yii\web\View */
/* @var $model app\models\ConsoleUsers */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="console-users-form">

    <?php $form = ActiveForm::begin(); ?>


    <?= $form->field($model, 'username')->textInput() ?>

    <?= $form->field($model, 'fullname')->textInput() ?>

    <?= $form->field($model, 'mobile_number')->textInput() ?>

    <?= $form->field($model, 'user_level')->dropDownList(['1'=> 'Insurance Company',
     '2'=>'Neon', '3'=>'URA'], ['prompt'=>'User type']
    ) ?>

    <?= $form->field($model, 'parent_insurance_company')->dropDownList(
        ArrayHelper::map(InsuranceCompanies::find()->all(), 'id', 'code'), ['prompt'=>'Select Your insurance Company']
    ) ?>

    <?= $form->field($model, 'email_address')->textInput() ?>

    <?//= $form->field($model, 'incorrect_access_count')->textInput() ?>

    <?= $form->field($model, 'password')->passwordInput() ?>

    <?= $form->field($model, 'password2')->passwordInput() ?>

    <?//= $form->field($model, 'date_created')->textInput() ?>

    <?//= $form->field($model, 'locked')->checkbox() ?>

    <?//= $form->field($model, 'user_level')->textInput() ?>

    <?//= $form->field($model, 'user_permissions')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Sign Up' : 'Update', ['class' => 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
