<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ConsoleUsersSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Users';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="console-users-index">

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
        //'filterModel' => $searchModel,
        'layout'=>"{items}\n{pager}",
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id',
            'username',
            'fullname',
            'mobile_number',
            'email_address:email',
            //'incorrect_access_count',
            //'password',
            //'date_created',
            'locked:boolean',
            'user_level',
            //'parent_insurance_company',
            //'user_permissions',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

     </div>
  </div>
</div>

</div>


<?php 
$script = <<< JS
$("document").ready(function(){ 
    $("#user").removeClass('active').addClass('active');
    $("#user_index").removeClass('active').addClass('active');_
  });
JS;
$this->registerJs($script);
?>
