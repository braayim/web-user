<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\UraStampdutyPrnReg */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Ura Stampduty Prn Regs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ura-stampduty-prn-reg-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'vrn',
            'tin',
            'registered_name',
            'amount',
            'prn',
            'date_registered',
            'payment_id',
            'status',
            'date_pushed_to_bank',
            'date_confirmed',
            'bank_trans_ref',
            'ura_trans_ref',
        ],
    ]) ?>

</div>
