<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ConsoleUsersSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="console-users-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'username') ?>

    <?= $form->field($model, 'fullname') ?>

    <?= $form->field($model, 'mobile_number') ?>

    <?= $form->field($model, 'email_address') ?>

    <?php // echo $form->field($model, 'incorrect_access_count') ?>

    <?php // echo $form->field($model, 'password') ?>

    <?php // echo $form->field($model, 'date_created') ?>

    <?php // echo $form->field($model, 'locked')->checkbox() ?>

    <?php // echo $form->field($model, 'user_level') ?>

    <?php // echo $form->field($model, 'parent_insurance_company') ?>

    <?php // echo $form->field($model, 'user_permissions') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
