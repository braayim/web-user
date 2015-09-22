<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\ConsoleUsers */

$this->title = $model->fullname;
$this->params['breadcrumbs'][] = ['label' => 'Console Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="console-users-view">

    
<section class="content-header">
<div class="row">
  <div class="col-xs-12">
    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
    </p>
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'username',
            'fullname',
            'mobile_number',
            'email_address',
            'incorrect_access_count',
            'password',
            'date_created',
            'locked:boolean',
            'user_level',
            'parent_insurance_company',
        ],
    ]) ?>
</div>
</div>
</section>
