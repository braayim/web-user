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
<?php 
$script = <<< JS
$("document").ready(function(){ 
    $("#user").removeClass('active').addClass('active');
    $("#user_create").removeClass('active').addClass('active');
  });
JS;
$this->registerJs($script);
?>
