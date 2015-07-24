<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\PaymentAggregators */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="payment-aggregators-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'name')->textInput() ?>

    <?= $form->field($model, 'access_code')->textInput() ?>

    <?= $form->field($model, 'access_password')->textInput() ?>

    <?= $form->field($model, 'security_code')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'active')->checkbox() ?>

    <?= $form->field($model, 'date_created')->textInput() ?>

    <?= $form->field($model, 'incorrect_access_count')->textInput() ?>

    <?= $form->field($model, 'locked')->checkbox() ?>

    <?= $form->field($model, 'email_address')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
