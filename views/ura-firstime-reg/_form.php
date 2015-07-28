<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\UraFirstimeReg */
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
    <div class="col-sm-4">
    <?= $form->field($model, 'registration_number', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Registration Number'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-4">
    <?= $form->field($model, 'registration_name', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Registration Name'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-4">
    <?= $form->field($model, 'registration_date', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Registration date'] ])->textInput()->label('') ?>
    </div>
   </div>

   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-sm-4">
    <?= $form->field($model, 'date_registered', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Date Registered'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-4">
    <?= $form->field($model, 'engine_capacity', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Engine Capacity'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-4">
    <?= $form->field($model, 'model', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Model'] ])->textInput()->label('') ?>
    </div>
   </div>

   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-sm-4">
    <?= $form->field($model, 'memo', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Memo'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-4">
    <?= $form->field($model, 'type', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Type'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-4">
    <?= $form->field($model, 'gross_weight', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Gross Weight'] ])->textInput()->label('') ?>
    </div>
   </div>

   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-sm-4">
    <?= $form->field($model, 'seating_capacity', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Sitting Capacity'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-4">
    <?= $form->field($model, 'purpose', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Purpose'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-4">
    <?= $form->field($model, 'engine_number', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Engine Number'] ])->textInput()->label('') ?>
    </div>
   </div>

   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-sm-4">
    <?= $form->field($model, 'colour', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Color'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-4">
    <?= $form->field($model, 'make', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Make'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-4">
    <?= $form->field($model, 'tyre_size', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Tyre Size'] ])->textInput()->label('') ?>
    </div>
   </div>

    <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-sm-4">
    <?= $form->field($model, 'tin', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Tin'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-4">
    <?= $form->field($model, 'chassis_number', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Chasis Number'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-4">
    <?= $form->field($model, 'year_of_manufacture', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Year of Manufacture'] ])->textInput()->label('') ?>
    </div>
   </div>

   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-sm-4">
    <?= $form->field($model, 'date_transacted', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Date Transacted'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-4">
    <?= $form->field($model, 'payment_id', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Payment Id'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-4">
    <?= $form->field($model, 'transacted')->checkbox() ?>
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



