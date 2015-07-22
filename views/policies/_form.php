<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\InsuranceCompanies;

/* @var $this yii\web\View */
/* @var $model app\models\Policies */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="policies-form">

    <?php $form = ActiveForm::begin(); ?>

     <?= $form->field($model, 'insurance_company')->dropDownList(
        ArrayHelper::map(InsuranceCompanies::find()->all(), 'id', 'code'), ['prompt'=>'Insurance Company']
    ) ?>

    <?= $form->field($model, 'date_created')->textInput() ?>

    <?= $form->field($model, 'start_date')->textInput() ?>

    <?= $form->field($model, 'end_date')->textInput() ?>

    <?= $form->field($model, 'registration_number')->textInput() ?>

    <?= $form->field($model, 'policy_holder_name')->textInput() ?>

    <?= $form->field($model, 'policy_holder_phone')->textInput() ?>

    <?= $form->field($model, 'policy_number')->textInput() ?>

    <?= $form->field($model, 'sticker_reference')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
