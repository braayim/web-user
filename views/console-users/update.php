<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\ConsoleUsers */

$this->title = 'Update Console Users: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Console Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="console-users-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
