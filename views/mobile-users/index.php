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

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Mobile Users', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'phone_number',
            'pin',
            'name',
            'date_created',
            'locked:boolean',
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
