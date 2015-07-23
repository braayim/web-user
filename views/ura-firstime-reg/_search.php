<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\UraFirstimeRegSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ura-firstime-reg-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'registration_number') ?>

    <?= $form->field($model, 'registration_name') ?>

    <?= $form->field($model, 'registration_date') ?>

    <?= $form->field($model, 'date_created') ?>

    <?php // echo $form->field($model, 'date_registered') ?>

    <?php // echo $form->field($model, 'engine_capacity') ?>

    <?php // echo $form->field($model, 'memo') ?>

    <?php // echo $form->field($model, 'model') ?>

    <?php // echo $form->field($model, 'type') ?>

    <?php // echo $form->field($model, 'gross_weight') ?>

    <?php // echo $form->field($model, 'seating_capacity') ?>

    <?php // echo $form->field($model, 'purpose') ?>

    <?php // echo $form->field($model, 'engine_number') ?>

    <?php // echo $form->field($model, 'colour') ?>

    <?php // echo $form->field($model, 'make') ?>

    <?php // echo $form->field($model, 'tyre_size') ?>

    <?php // echo $form->field($model, 'year_of_manufacture') ?>

    <?php // echo $form->field($model, 'chassis_number') ?>

    <?php // echo $form->field($model, 'tin') ?>

    <?php // echo $form->field($model, 'transacted')->checkbox() ?>

    <?php // echo $form->field($model, 'date_transacted') ?>

    <?php // echo $form->field($model, 'payment_id') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
