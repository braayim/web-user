<?php
use yii\helpers\Html;
use yii\grid\GridView;
?>
<div class="payment_aggregators_index">
    <?php  
	$model->sort = false; 

	if($type == 'Excel') {
		echo "<table><tr> <th colspan='7'><h3> Aggregators</h3> </th> </tr> </table>";
	}
    ?>
    <?= GridView::widget([
        'dataProvider' => $model,
		'layout' => '{items}',
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            //'id',
            'username',
            'fullname',
            'mobile_number',
            'email_address:email',
            'incorrect_access_count',
            //'password',
            //'date_created',
            'locked:boolean',
            'user_level',
            'parent_insurance_company',
            //'user_permissions',
            ],
    ]); ?>

</div>