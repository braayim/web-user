<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\AuthItem */
/* @var $form yii\widgets\ActiveForm */
?>
<div class="col-xs-12 col-lg-12">
  <div class=" box view-item col-xs-12 col-lg-12">
<div class="auth-item-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="col-xs-12 col-lg-12 no-padding">
    <p>&nbsp;</p>
    </div>

<div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-sm-6">
    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
  </div>
    <div class="col-sm-6" id="type">
    <?= $form->field($model, 'type')->dropDownList(['2'=> 'Permission', '1'=>'Role'], ['id'=>'select_type', 'prompt'=>'Select Type']) ?>
   </div>

    <div class="col-sm-6" id="comment">
    <?= $form->field($model, 'description')->textInput() ?>
    </div>
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
    if($('#select_type').val() !== '1'){
        $('#comment').hide();
    }
    $('#select_type').change(function(){
        if($(this).val() == '1'){
            $('#comment').show();
        }
        else {
            $('#authitem-descriptiont').val('');
            $('#comment').hide();
        }
    });
});
JS;
$this->registerJs($script);
?>
