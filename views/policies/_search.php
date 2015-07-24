<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\PoliciesSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="policies-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'date_created') ?>

    <?= $form->field($model, 'start_date') ?>

    <?= $form->field($model, 'end_date') ?>

    <?= $form->field($model, 'registration_number') ?>

    <?php // echo $form->field($model, 'policy_holder_name') ?>

    <?php // echo $form->field($model, 'policy_holder_phone') ?>

    <?php // echo $form->field($model, 'policy_number') ?>

    <?php // echo $form->field($model, 'insurance_company') ?>

    <?php // echo $form->field($model, 'sticker_reference') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
