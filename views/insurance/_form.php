<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\InsuranceCompanies */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="col-xs-12 col-lg-12">
  <div class=" box view-item col-xs-12 col-lg-12">
<div class="insurance-companies-form">
	<?php
	if($this->context->action->id == 'update')
		$action = ['update', 'id'=>$_REQUEST['id']];
	else
		$action = ['create'];
    ?>
	
    <?php $form = ActiveForm::begin([
			'id' => 'insurance-companies-form',
			'action' => $action,
      'enableAjaxValidation' => true,
			
    ]); ?>

   </br>
   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-sm-6">
    <?= $form->field($model, 'code', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Code'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-6">
    <?= $form->field($model, 'description', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Description'] ])->textInput()->label('') ?>
    </div>
   </div>

   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-sm-6">
    <?= $form->field($model, 'address', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Address'] ])->textInput()->label('') ?>
    </div>
    <div class="col-sm-6">
    <?= $form->field($model, 'email_address', ['inputOptions'=>[ 'class'=>'form-control', 'placeholder'=> 'Email Address'] ])->textInput()->label('') ?>
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


