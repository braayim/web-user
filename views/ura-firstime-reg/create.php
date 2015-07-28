<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\UraFirstimeReg */

$this->title = 'URA First Time Registration';
$this->params['breadcrumbs'][] = ['label' => 'Ura Firstime Regs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ura-firstime-reg-create">

<div class="col-xs-12">
  <div class="col-lg-4 col-sm-4 col-xs-12 no-padding"><h3 class="box-title"><i class="fa fa-plus"></i> <?= Html::encode($this->title) ?></h3>
  </div>
 <div class="col-xs-4"></div>
   <div class="col-lg-4 col-sm-4 col-xs-12 no-padding" style="padding-top: 20px !important;">
	<div class="col-xs-4"></div>
	<div class="col-xs-4"></div>
	<div class="col-xs-4 left-padding">
	
	</div>
   </div>
 </div>

<div class="policies-create">
     <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
</div>

</div>

<?php 
$script = <<< JS
$("document").ready(function(){ 
    $("#ura").removeClass('active').addClass('active');
    $("#ura_create").removeClass('active').addClass('active');
  });
JS;
$this->registerJs($script);
?>
