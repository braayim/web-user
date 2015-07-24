<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\UraStampdutyPrnRegSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ura-stampduty-prn-reg-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'vrn') ?>

    <?= $form->field($model, 'tin') ?>

    <?= $form->field($model, 'registered_name') ?>

    <?= $form->field($model, 'amount') ?>

    <?php // echo $form->field($model, 'prn') ?>

    <?php // echo $form->field($model, 'date_registered') ?>

    <?php // echo $form->field($model, 'payment_id') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'date_pushed_to_bank') ?>

    <?php // echo $form->field($model, 'date_confirmed') ?>

    <?php // echo $form->field($model, 'bank_trans_ref') ?>

    <?php // echo $form->field($model, 'ura_trans_ref') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
