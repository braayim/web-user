
<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\InsuranceCompanies */

$this->params['breadcrumbs'][] = ['label' => 'Insurance Companies', 'url' => ['index']];

?>
<div class="col-xs-12">
  <div class="col-lg-4 col-sm-4 col-xs-12 no-padding"><h3 class="box-title"><i class="fa fa-plus"></i> Add Insurance Company</h3>
  </div>
 <div class="col-xs-4"></div>
   <div class="col-lg-4 col-sm-4 col-xs-12 no-padding" style="padding-top: 20px !important;">
	<div class="col-xs-4"></div>
	<div class="col-xs-4"></div>
	<div class="col-xs-4 left-padding">
	
	</div>
   </div>
 </div>

<div class="insurance-companies-create">
     <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>

<?php 
$script = <<< JS
$("document").ready(function(){ 
    $("#insurance").removeClass('active').addClass('active');
    $("#insurance_create").removeClass('active').addClass('active');
  });
JS;
$this->registerJs($script);
?>