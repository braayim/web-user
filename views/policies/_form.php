<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\InsuranceCompanies;

/* @var $this yii\web\View */
/* @var $model app\models\Policies */
/* @var $form yii\widgets\ActiveForm */
?>



<div class="col-xs-12 col-lg-12">
  <div class=" box view-item col-xs-12 col-lg-12">
<div class="policies-form">
    <?php
    if($this->context->action->id == 'update')
        $action = ['update', 'id'=>$_REQUEST['id']];
    else
        $action = ['create'];
    ?>
    
    <?php $form = ActiveForm::begin(); ?>

   </br>
   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-sm-6">
    <?= $form->field($model, 'insurance_company')->dropDownList(
        ArrayHelper::map(InsuranceCompanies::find()->all(), 'id', 'code'), ['prompt'=>'Insurance Company']
    )->label('') ?>
    </div>
    <div class="col-sm-6">
    <?= $form->field($model, 'registration_number', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Registration Number'] ])->textInput()->label('') ?>
    </div>
   </div>

   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-sm-4">
    <?= $form->field($model, 'date_created', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Date Created'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-4">
    <?= $form->field($model, 'start_date', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Start Date'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-4">
    <?= $form->field($model, 'end_date', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'End Date'] ])->textInput()->label('') ?>
    </div>
   </div>

   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-sm-6">
    <?= $form->field($model, 'policy_holder_phone', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Policy Holiday Phone'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-6">
    <?= $form->field($model, 'policy_holder_name', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'policy Holder Name'] ])->textInput()->label('') ?>
    </div>
   </div>

   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-sm-6">
    <?= $form->field($model, 'policy_number', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'policy Number'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-6">
    <?= $form->field($model, 'sticker_reference', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Sticker Reference'] ])->textInput()->label('') ?>
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