<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\AuthItem;

/* @var $this yii\web\View */
/* @var $model app\models\AuthItemChild */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="col-xs-12 col-lg-12">
  <div class=" box view-item col-xs-12 col-lg-12">
<div class="auth-item-child-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="col-xs-12 col-lg-12 no-padding">
    <p>&nbsp;</p>
    </div>

<div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-sm-6">
    <?= $form->field($model, 'parent')->dropDownList(
        ArrayHelper::map(AuthItem::find()->where(['type'=> 1])->all(), 'name', 'name'), 
        [ 'prompt'=>'Select Role'])->label(''); ?>
  </div>
    <div class="col-sm-6">
    <?= $form->field($model, 'child')->dropDownList(
        ArrayHelper::map(AuthItem::find()->where(['type'=> 2])->all(), 'name', 'name'), 
        [ 'prompt'=>'Assign Permission'])->label(''); ?>
  </div>
  
 <div class="form-group col-xs-12 col-sm-6 col-lg-4 no-padding">
    <div class="col-xs-6">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => 'btn btn-block btn-primary']) ?>
    </div>
    <div class="col-xs-6">
    <?= Html::resetButton('Reset', ['class' => 'btn btn-default btn-block']) ?>
    </div>
</div>

    <?php ActiveForm::end(); ?>

</div>
</div>
</div>

<?php 
$script = <<< JS
$("document").ready(function(){ 
    $("#user").removeClass('active').addClass('active');
    $("#user_permissions").removeClass('active').addClass('active');
});
JS;
$this->registerJs($script);
?>