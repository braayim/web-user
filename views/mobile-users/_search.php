<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\MobileUsersSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="mobile-users-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'phone_number') ?>

    <?= $form->field($model, 'pin') ?>

    <?= $form->field($model, 'name') ?>

    <?= $form->field($model, 'date_created') ?>

    <?php // echo $form->field($model, 'locked')->checkbox() ?>

    <?php // echo $form->field($model, 'type') ?>

    <?php // echo $form->field($model, 'incorrect_access_count') ?>

    <?php // echo $form->field($model, 'pin_change_flag')->checkbox() ?>

    <?php // echo $form->field($model, 'parent_insurance_company') ?>

    <?php // echo $form->field($model, 'auth_imsi') ?>

    <?php // echo $form->field($model, 'auth_imei') ?>

    <?php // echo $form->field($model, 'activation_code') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
