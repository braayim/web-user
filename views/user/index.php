<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ConsoleUsersSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Console Users';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="console-users-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Console Users', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id',
            'username',
            'fullname',
            'mobile_number',
            'email_address:email',
            //'incorrect_access_count',
            //'password',
            'date_created',
            'locked:boolean',
            //'user_level',
            //'parent_insurance_company',
            //'user_permissions',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
