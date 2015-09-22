<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\UraStampdutyPrnRegSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Ura Stampduty Prn Regs';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ura-stampduty-prn-reg-index">
<div class="row">
 <div class="col-xs-12">
    <div class="col-lg-4 col-sm-4 col-xs-12 no-padding"><h3 class="box-title"><i class="fa fa-th-list"></i> <?php echo $this->title ?></h3></div>
        <div class="col-xs-4 col-sm-4 col-xs-12 no-padding" style="padding-top: 20px !important;"><?php echo $this->render('_search', ['model' => $searchModel]); ?></div>
    <div class="col-lg-4 col-sm-4 col-xs-12 no-padding" style="padding-top: 20px !important;">
    <div class="col-xs-4 left-padding">
    </div>
    <div class="col-xs-4 left-padding">
    <?= Html::a('<i class="fa fa-file-excel-o"></i>&nbsp;&nbsp; PDF', ['export-data/export-to-pdf', 'model'=>get_class($searchModel)], ['class' => 'btn btn-block btn-danger btn-sml', 'target'=>'_blank']) ?>
    </div>
    <div class="col-xs-4 left-padding">
    <?= Html::a('<i class="fa fa-file-pdf-o"></i>&nbsp;&nbsp; EXCEL', ['export-data/export-excel', 'model'=>get_class($searchModel)], ['class' => 'btn btn-block btn-success btn-sml', 'target'=>'_blank']) ?>
    </div>
   </div>
  </div>
</div>

    <div class="row">
    <div class="col-xs-12" style="padding-top: 10px;">
    <div class="box">
    <div class="box-body table-responsive">
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id',
            'vrn',
            'tin',
            'registered_name',
            'amount',
            'prn',
            // 'date_registered',
            'payment_id',
            // 'status',
            // 'date_pushed_to_bank',
            // 'date_confirmed',
            'bank_trans_ref',
            'ura_trans_ref',

            ['class' => 'yii\grid\ActionColumn'],
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
    $("#ura").removeClass('active').addClass('active');
    $("#ura_stampduty").removeClass('active').addClass('active');
  });
JS;
$this->registerJs($script);
?>
