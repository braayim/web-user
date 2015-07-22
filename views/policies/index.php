<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\PoliciesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Policies';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="policies-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Policies', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
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

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
