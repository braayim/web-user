<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\UraFirstimeReg */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Ura Firstime Regs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ura-firstime-reg-view">

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
            'registration_number',
            'registration_name',
            'registration_date',
            'date_created',
            'date_registered',
            'engine_capacity',
            'memo',
            'model',
            'type',
            'gross_weight',
            'seating_capacity',
            'purpose',
            'engine_number',
            'colour',
            'make',
            'tyre_size',
            'year_of_manufacture',
            'chassis_number',
            'tin',
            'transacted:boolean',
            'date_transacted',
            'payment_id',
        ],
    ]) ?>

</div>
