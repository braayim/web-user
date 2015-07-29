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
            'name',
            'access_code',
            'active:boolean',
            'date_created',
            'locked:boolean',
            'email_address:email',
            ],
    ]); ?>

</div>
