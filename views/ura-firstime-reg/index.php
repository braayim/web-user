<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\UraFirstimeRegSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Ura Firstime Regs';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ura-firstime-reg-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Ura Firstime Reg', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'registration_number',
            'registration_name',
            'registration_date',
            'date_created',
            // 'date_registered',
            // 'engine_capacity',
            // 'memo',
            // 'model',
            // 'type',
            // 'gross_weight',
            // 'seating_capacity',
            // 'purpose',
            // 'engine_number',
            // 'colour',
            // 'make',
            // 'tyre_size',
            // 'year_of_manufacture',
            // 'chassis_number',
            // 'tin',
            // 'transacted:boolean',
            // 'date_transacted',
            // 'payment_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
