<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\MobileUsers */

$this->title = 'Create Mobile Users';
$this->params['breadcrumbs'][] = ['label' => 'Mobile Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="mobile-users-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
