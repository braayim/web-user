<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\MobileUsers */

$this->title = 'Update Mobile Users: ' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Mobile Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="mobile-users-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
