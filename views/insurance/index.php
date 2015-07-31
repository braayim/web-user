<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\InsuranceCompaniesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Manage Insurance Companies';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="insurance-companies-index">

  <?php if($model->isNewRecord) 
      echo $this->render('create', ['model' => $model]);  
   else
      echo $this->render('update', ['model' => $model]);  
  ?>

<div class="col-xs-12">
  <div class="col-lg-6 col-sm-4 col-xs-12 no-padding"><h3 class="box-title"><i class="fa fa-th-list"></i> <?php echo $this->title ?></h3></div>
  <div class="col-xs-2"></div>
  <div class="col-lg-4 col-sm-4 col-xs-12 no-padding" style="padding-top: 20px !important;">
    <div class="col-xs-4 left-padding">
       
    </div>
    <div class="col-xs-4 left-padding">
    <?= Html::a('<i class="fa fa-file-excel-o"></i>&nbsp;&nbsp; PDF', ['export-data/export-to-pdf', 'model'=>get_class($searchModel)], ['class' => 'btn btn-block btn-danger btn-sml', 'target'=>'_blank']) ?>
    </div>
    <div class="col-xs-4 left-padding">
    <?= Html::a('<i class="fa fa-file-pdf-o"></i>&nbsp;&nbsp; EXCEL', ['export-data/export-excel', 'model'=>get_class($searchModel)], ['class' => 'btn btn-block btn-primary btn-sml', 'target'=>'_blank']) ?>
    </div>
  </div>
</div>

<div class="col-xs-12" style="padding-top: 10px;">
    <div class="box">
<div class="box-body table-responsive">
    <div class="state-index">
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'layout'  => "{items}\n{pager}",
        'headerRowOptions' => ['style'=>'background-color:#fff'],

        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'code',
            'description',
            'address',
            'email_address:email',

            [
             'class' => 'app\components\CustomActionColumn',
             ],
        ],
    ]); ?>
        </div>
    </div>
  </div>
</div>

</div>

<?php 
$script = <<< JS
$("document").ready(function(){ 
    $("#insurance").removeClass('active').addClass('active');
  });
JS;
$this->registerJs($script);
?>

