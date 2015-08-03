<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\MessageOutboxSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="message-outbox-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'message_text') ?>

    <?= $form->field($model, 'time_generated') ?>

    <?= $form->field($model, 'time_sent') ?>

    <?= $form->field($model, 'recipient_number') ?>

    <?php // echo $form->field($model, 'message_status') ?>

    <?php // echo $form->field($model, 'flash_message')->checkbox() ?>

    <?php // echo $form->field($model, 'email_message')->checkbox() ?>

    <?php // echo $form->field($model, 'email_subject') ?>

    <?php // echo $form->field($model, 'email_attachment') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
