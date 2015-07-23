<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\UraFirstimeReg */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ura-firstime-reg-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'registration_number')->textInput() ?>

    <?= $form->field($model, 'registration_name')->textInput() ?>

    <?= $form->field($model, 'registration_date')->textInput() ?>

    <?= $form->field($model, 'date_created')->textInput() ?>

    <?= $form->field($model, 'date_registered')->textInput() ?>

    <?= $form->field($model, 'engine_capacity')->textInput() ?>

    <?= $form->field($model, 'memo')->textInput() ?>

    <?= $form->field($model, 'model')->textInput() ?>

    <?= $form->field($model, 'type')->textInput() ?>

    <?= $form->field($model, 'gross_weight')->textInput() ?>

    <?= $form->field($model, 'seating_capacity')->textInput() ?>

    <?= $form->field($model, 'purpose')->textInput() ?>

    <?= $form->field($model, 'engine_number')->textInput() ?>

    <?= $form->field($model, 'colour')->textInput() ?>

    <?= $form->field($model, 'make')->textInput() ?>

    <?= $form->field($model, 'tyre_size')->textInput() ?>

    <?= $form->field($model, 'year_of_manufacture')->textInput() ?>

    <?= $form->field($model, 'chassis_number')->textInput() ?>

    <?= $form->field($model, 'tin')->textInput() ?>

    <?= $form->field($model, 'transacted')->checkbox() ?>

    <?= $form->field($model, 'date_transacted')->textInput() ?>

    <?= $form->field($model, 'payment_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
