<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\UraFirstimeReg */

$this->title = 'Create Ura Firstime Reg';
$this->params['breadcrumbs'][] = ['label' => 'Ura Firstime Regs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ura-firstime-reg-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
