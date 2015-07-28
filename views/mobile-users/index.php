<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\MobileUsersSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Mobile Users';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="mobile-users-index">

    <div class="col-xs-12">
    <div class="col-lg-4 col-sm-4 col-xs-12 no-padding"><h3 class="box-title"><i class="fa fa-th-list"></i> <?php echo $this->title ?></h3></div>
        <div class="col-xs-4 col-sm-4 col-xs-12 no-padding" style="padding-top: 20px !important;"><?php echo $this->render('_search', ['model' => $searchModel]); ?></div>
    <div class="col-lg-4 col-sm-4 col-xs-12 no-padding" style="padding-top: 20px !important;">
    <div class="col-xs-4 left-padding">
       <?= Html::a('<i class="fa fa-plus"></i>&nbsp;&nbsp; ADD', ['create'], ['class' => 'btn btn-block btn-primary']) ?>
    </div>
    <div class="col-xs-4 left-padding">
    <?= Html::a('<i class="fa fa-file-excel-o"></i>&nbsp;&nbsp; PDF', ['export-data/export-to-pdf', 'model'=>get_class($searchModel)], ['class' => 'btn btn-block btn-danger btn-sml', 'target'=>'_blank']) ?>
    </div>
    <div class="col-xs-4 left-padding">
    <?= Html::a('<i class="fa fa-file-pdf-o"></i>&nbsp;&nbsp; EXCEL', ['export-data/export-excel', 'model'=>get_class($searchModel)], ['class' => 'btn btn-block btn-success btn-sml', 'target'=>'_blank']) ?>
    </div>
  </div>
</div>

    <div class="col-xs-12" style="padding-top: 10px;">
    <div class="box">
    <div class="box-body table-responsive">
    <div class="state-index">
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'layout'  => "{items}\n{pager}",
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'name',
            'phone_number',
            //'pin',
            'date_created',
            // 'locked:boolean',
            // 'type',
            // 'incorrect_access_count',
            // 'pin_change_flag:boolean',
            // 'parent_insurance_company',
            // 'auth_imsi',
            // 'auth_imei',
            // 'activation_code',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    </div>
    </div>
</div>

</div>
