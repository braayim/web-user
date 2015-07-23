<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\UraStampdutyPrnReg */

$this->title = 'Create Ura Stampduty Prn Reg';
$this->params['breadcrumbs'][] = ['label' => 'Ura Stampduty Prn Regs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ura-stampduty-prn-reg-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
