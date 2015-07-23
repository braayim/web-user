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

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Ura Stampduty Prn Reg', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'vrn',
            'tin',
            'registered_name',
            'amount',
            // 'prn',
            // 'date_registered',
            // 'payment_id',
            // 'status',
            // 'date_pushed_to_bank',
            // 'date_confirmed',
            // 'bank_trans_ref',
            // 'ura_trans_ref',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
