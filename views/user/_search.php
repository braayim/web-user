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

    <?= $form->field($model, 'modelSearch')->textInput(['placeHolder'=>'Find User'])->label(false) ?>
    <?php ActiveForm::end(); ?>

</div>
