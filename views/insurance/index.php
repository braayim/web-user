<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\InsuranceCompaniesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Manage Insurance Companies';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="insurance-companies-index">

    <h2><?= Html::encode($this->title) ?></h2>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Insurance Companies', ['create'], ['class' => 'btn btn-primary']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'layout'  => "{items}\n{pager}",
        'headerRowOptions' => ['style'=>'background-color:#fff'],

        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'code',
            'description',
            'address',
            'email_address:email',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
