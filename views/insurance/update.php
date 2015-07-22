<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\InsuranceCompanies */

$this->title = 'Update Insurance Companies: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Insurance Companies', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="insurance-companies-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
