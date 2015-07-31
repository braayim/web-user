<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use app\models\InsuranceCompanies;
use app\models\AuthItem;

/* @var $this yii\web\View */
/* @var $model app\models\ConsoleUsers */
/* @var $form yii\widgets\ActiveForm */
?>


<div class="col-xs-12 col-lg-12">
  <div class=" box view-item col-xs-12 col-lg-12">
<div class="console-users-form">
    <?php $form = ActiveForm::begin(); ?>

   <div class="col-xs-12 col-lg-12 no-padding">
    <p>&nbsp;</p>
    </div>
   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-sm-6">
    <?= $form->field($model, 'user_level')->dropDownList(
        ArrayHelper::map(AuthItem::find()->where(['type'=> 1])->all(), 'name', 'description'), 
        [
        'id'=>'user_level',
        'prompt'=>'Type of User'
        ])->label(''); ?>
    </div>
    <div class="col-sm-6" id="parent_insurance">
    <?= $form->field($model, 'parent_insurance_company')->dropDownList(
        ArrayHelper::map(InsuranceCompanies::find()->all(), 'id', 'code'), 
        [
        'id'=>'parent_ins',
        'prompt'=>'Select Insurance Company'
        ])->label(''); ?>
    </div>
   </div>

   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-sm-6">
    <?= $form->field($model, 'username', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Username'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-6">
    <?= $form->field($model, 'fullname', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Fullname'] ])->textInput()->label('') ?>
    </div>
   </div>

   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-sm-6">
    <?= $form->field($model, 'mobile_number', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Mobile Number'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-6">
    <?= $form->field($model, 'email_address', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Email Address'] ])->textInput()->label('') ?>
    </div>
   </div>

   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-sm-6">
    <?= $form->field($model, 'password', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Password'] ])->passwordInput()->label('') ?>
    </div>
    <div class="col-sm-6">
    <?= $form->field($model, 'password2', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Comfirm Password'] ])->passwordInput()->label('') ?>
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
    if($('#user_level').val() !== 'insurance_user'){
        $('#parent_insurance').hide();
    }
    $('#user_level').change(function(){
        if($(this).val() == 'insurance_user'){
            $('#parent_insurance').show();
        }
        else {
            $('#parent_ins').prop('selectedIndex', 0);
            $('#parent_insurance').hide();
        }
    });
});
JS;
$this->registerJs($script);
?>
