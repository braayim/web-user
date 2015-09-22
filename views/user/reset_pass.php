<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

$this->title = "Change Password"; 
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="col-xs-12">
  <div class="col-lg-6 col-sm-6 col-xs-12 no-padding"><h3 class="box-title"><i class="fa  fa-unlock"></i> <?= $model->fullname.' - '.Html::encode($this->title); ?></h3></div>
</div>

<div class="col-xs-12 col-lg-12">
  <div class="box view-item col-xs-12 col-lg-12">
    <div class="form">
	<?php $form = ActiveForm::begin([
			'id' => 'change-password-form',
			'fieldConfig' => [
			    'template' => "{label}{input}{error}",
			],
    ]); ?>
    <div class="col-xs-12 col-lg-12 no-padding">
    <p>&nbsp;</p>
    </div>

	<?= $form->field($model, 'new_pass')->passwordInput(['maxlength' => 60, 'placeholder' => $model->getAttributeLabel('new_pass')]) ?>

	<?= $form->field($model, 'password2')->passwordInput(['maxlength' => 60, 'placeholder' => $model->getAttributeLabel('password2')]) ?>

   <div class="form-group col-xs-12 col-sm-6 col-lg-4 no-padding">
	<div class="col-xs-6">
           <?= Html::submitButton(Yii::t('app', 'Save'), ['class' =>'btn btn-block btn-primary']) ?>
	</div>
	<div class="col-xs-6">
	   <?= Html::a('Cancel', ['/site/index'], ['class' => 'btn btn-default btn-block']) ?>
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
  });
JS;
$this->registerJs($script);
?>