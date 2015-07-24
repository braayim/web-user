<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\MobileUsersSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="mobile-users-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>
<?= $form->field($model, 'modelSearch')->textInput(['placeHolder'=>'Search'])->label(false) ?>
    <?php ActiveForm::end(); ?>

</div>
