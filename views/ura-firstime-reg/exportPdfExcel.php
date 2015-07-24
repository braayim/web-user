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
            'registration_number',
            'registration_name',
            'registration_date',
            //'date_created',
            // 'date_registered',
            'engine_capacity',
            'memo',
            'model',
            'type',
            //'gross_weight',
            'seating_capacity',
            //'purpose',
            'engine_number',
            // 'colour',
            'make',
            // 'tyre_size',
            'year_of_manufacture',
            'chassis_number',
            'tin',
            // 'transacted:boolean',
            // 'date_transacted',
            // 'payment_id',
        ],
    ]); ?>

</div>
