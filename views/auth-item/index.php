<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\AuthItemSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Auth Items';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="auth-item-index">

    <?php if($model->isNewRecord) 
      echo $this->render('create', ['model' => $model]);  
   else
      echo $this->render('update', ['model' => $model]);  
  ?>
    </p>
    <div class="col-xs-12" style="padding-top: 10px;">
    <div class="box">
    <div class="box-body table-responsive">
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel'  => $searchModel,
        'layout'  => "{items}\n{pager}",
        'headerRowOptions' => ['style'=>'background-color:#fff'],
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
            'attribute' => 'Name',
            'value'=>'name'
            ],
            [
            'attribute' => 'Type',
            'value' => function ($model) {
                    return $model->type == '1'
                        ? '<span> Row </span>'
                        : 'Permission';
                },
            'format' => 'html',
            ],
            //'description:ntext',
            //'rule_name',
            //'data:ntext',
            // 'created_at',
            // 'updated_at',

            [
             'class' => 'app\components\CustomActionColumn',
             ],
        ],
    ]); ?>
    </div>
    </div>
  </div>
</div>
