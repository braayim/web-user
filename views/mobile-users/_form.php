<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\MobileUsers */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="mobile-users-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'phone_number')->textInput() ?>

    <?= $form->field($model, 'pin')->textInput() ?>

    <?= $form->field($model, 'name')->textInput() ?>

    <?= $form->field($model, 'date_created')->textInput() ?>

    <?= $form->field($model, 'locked')->checkbox() ?>

    <?= $form->field($model, 'type')->textInput() ?>

    <?= $form->field($model, 'incorrect_access_count')->textInput() ?>

    <?= $form->field($model, 'pin_change_flag')->checkbox() ?>

    <?= $form->field($model, 'parent_insurance_company')->textInput() ?>

    <?= $form->field($model, 'auth_imsi')->textInput() ?>

    <?= $form->field($model, 'auth_imei')->textInput() ?>

    <?= $form->field($model, 'activation_code')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?php 
$script = <<< JS
$("document").ready(function(){ 
    $("#mobile_users").removeClass('active').addClass('active');
    $("#muser_create").removeClass('active').addClass('active');
  });
JS;
$this->registerJs($script);
?>
