<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\ConsoleUsers */

$this->title = 'Account Sign Up';
$this->params['breadcrumbs'][] = ['label' => 'Console Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="console-users-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
