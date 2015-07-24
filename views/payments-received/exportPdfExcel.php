<?php
use yii\helpers\Html;
use yii\grid\GridView;
?>
<div class="payment_received_index">
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
            'aggregator',
            'aggregator_transaction_id',
            'vehicle_reference',
            'aggregator_payment_processed_date',
            'date_received',
            'aggregator_payment_reference',
            'amount',
            'aggregator_memo',
            'payer_mobile',
            'payer_email:email',
            'payer_name',
            'payment_recon_flag',
            'payment_status',
            'sticker_generated:boolean',
        ],
    ]); ?>

</div>
