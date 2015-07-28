<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\InboxSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Inbox';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="inbox-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php  echo $this->render('_search', ['model' => $searchModel]); ?>


    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'showHeader'=>false,
        'layout'=>"{items}\n{pager}",
        'columns' => [
            'subject',
            'date_received',
            'sender',
            'recipient',
            //'message_text',
            // 'read:boolean',
            // 'recipient_type',
        ],
    ]); ?>

</div>

<?php 
$script = <<< JS
$("document").ready(function(){ 
    $("#messages").removeClass('active').addClass('active');
    $("#inbox").removeClass('active').addClass('active');
  });
JS;
$this->registerJs($script);
?>
