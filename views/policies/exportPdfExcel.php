<?php
use yii\helpers\Html;
use yii\grid\GridView;
?>
<div class="insurance-index">
    <?php  
	$model->sort = false; 

	if($type == 'Excel') {
		echo "<table><tr> <th colspan='7'><h3> Test</h3> </th> </tr> </table>";
	}
    ?>
    <?= GridView::widget([
        'dataProvider' => $model,
		'layout' => '{items}',
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'insuranceCompany.code',
            'end_date',
            'registration_number',
            'policy_holder_name',
            'policy_holder_phone',
            'policy_number',
            'sticker_reference',
        ],
    ]); ?>

</div>
