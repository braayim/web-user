<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\MessageOutboxSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Message Outboxes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="message-outbox-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>


    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'showHeader' => false,
        'layout' => "{items}\n{pager}",
        'columns' => [
            'subject',
            'time_generated',
            'time_sent',
            'recipient_number',
            // 'message_status',
            // 'flash_message:boolean',
            // 'email_message:boolean',
            // 'email_subject:email',
            // 'email_attachment:email',
        ],
    ]); ?>

</div>

<?php 
$script = <<< JS
$("document").ready(function(){ 
    $("#messages").removeClass('active').addClass('active');
    $("#outbox").removeClass('active').addClass('active');
  });
JS;
$this->registerJs($script);
?>
