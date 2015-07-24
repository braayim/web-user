<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\PaymentsReceived */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Payments Receiveds', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="payments-received-view">

    <h1><?= Html::encode($this->title) ?></h1>


    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'aggregator',
            'aggregator_transaction_id',
            'vehicle_reference',
            'aggregator_payment_processed_date',
            'date_received',
            'aggregator_payment_reference',
            'amount',
            'aggregator_memo',
            'payer_mobile',
            'payer_email:email',
            'payer_name',
            'payment_recon_flag',
            'payment_status',
            'sticker_generated:boolean',
        ],
    ]) ?>

</div>
