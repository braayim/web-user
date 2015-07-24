<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\PoliciesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Policies';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="col-xs-12">
  <div class="col-lg-4 col-sm-4 col-xs-12 no-padding"><h3 class="box-title"><i class="fa fa-th-list"></i> <?= $this->title ?></h3></div>
  <div class="col-xs-4"></div>
  <div class="col-lg-4 col-sm-4 col-xs-12 no-padding" style="padding-top: 20px !important;">
    <div class="col-xs-4 left-padding">
        <?= Html::a('ADD', ['create'], ['class' => 'btn btn-block btn-success']) ?>
    </div>
    <div class="col-xs-4 left-padding">
    <?= Html::a('PDF', ['/export-data/export-to-pdf', 'model'=>get_class($searchModel)], ['class' => 'btn btn-block btn-warning', 'target'=>'_blank']) ?>
    </div>
    <div class="col-xs-4 left-padding">
    <?= Html::a('EXCEL', ['/export-data/export-excel', 'model'=>get_class($searchModel)], ['class' => 'btn btn-block btn-primary', 'target'=>'_blank']) ?>
    </div>
  </div>
</div>

    <div class="col-xs-12" style="padding-top: 10px;">
    <div class="box">
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'layout'  => "{items}\n{pager}",
        'headerRowOptions' => ['style'=>'background-color:#fff'],
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'insuranceCompany.code',
            'end_date',
            'registration_number',
            'policy_holder_name',
            'policy_holder_phone',
            'policy_number',
            'sticker_reference',

             [
             'class' => 'app\components\CustomActionColumn',
             ],
        ],
    ]); ?>

</div>
</div>
</div>
