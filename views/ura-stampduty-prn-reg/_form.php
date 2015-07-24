<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\UraStampdutyPrnReg */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ura-stampduty-prn-reg-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'vrn')->textInput() ?>

    <?= $form->field($model, 'tin')->textInput() ?>

    <?= $form->field($model, 'registered_name')->textInput() ?>

    <?= $form->field($model, 'amount')->textInput() ?>

    <?= $form->field($model, 'prn')->textInput() ?>

    <?= $form->field($model, 'date_registered')->textInput() ?>

    <?= $form->field($model, 'payment_id')->textInput() ?>

    <?= $form->field($model, 'status')->textInput() ?>

    <?= $form->field($model, 'date_pushed_to_bank')->textInput() ?>

    <?= $form->field($model, 'date_confirmed')->textInput() ?>

    <?= $form->field($model, 'bank_trans_ref')->textInput() ?>

    <?= $form->field($model, 'ura_trans_ref')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
