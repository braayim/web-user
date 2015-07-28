<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\PaymentAggregatorsSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="payment-aggregators-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'name') ?>

    <?= $form->field($model, 'access_code') ?>

    <?= $form->field($model, 'access_password') ?>

    <?= $form->field($model, 'security_code') ?>

    <?php // echo $form->field($model, 'active')->checkbox() ?>

    <?php // echo $form->field($model, 'date_created') ?>

    <?php // echo $form->field($model, 'incorrect_access_count') ?>

    <?php // echo $form->field($model, 'locked')->checkbox() ?>

    <?php // echo $form->field($model, 'email_address') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
