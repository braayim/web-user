<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\PaymentAggregators */

$this->title = 'Create Payment Aggregators';
$this->params['breadcrumbs'][] = ['label' => 'Payment Aggregators', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="payment-aggregators-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
