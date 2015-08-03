<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\MessageOutbox */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Message Outboxes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="message-outbox-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'message_text:ntext',
            'time_generated',
            'time_sent',
            'recipient_number',
            'message_status',
            'flash_message:boolean',
            'email_message:boolean',
            'email_subject:email',
            'email_attachment:email',
        ],
    ]) ?>

</div>
