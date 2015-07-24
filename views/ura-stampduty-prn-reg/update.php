<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\UraStampdutyPrnReg */

$this->title = 'Update Ura Stampduty Prn Reg: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Ura Stampduty Prn Regs', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="ura-stampduty-prn-reg-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
