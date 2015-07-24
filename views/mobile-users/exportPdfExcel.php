<?php
use yii\helpers\Html;
use yii\grid\GridView;
?>
<div class="insurance-index">
    <?php  
    $model->sort = false; 

    if($type == 'Excel') {
        echo "<table><tr> <th colspan='7'><h3>Heading</h3> </th> </tr> </table>";
    }
    ?>
    <?= GridView::widget([
        'dataProvider' => $model,
        'layout' => '{items}',
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'name',
            'phone_number',
            'date_created',
        ],
    ]); ?>

</div>
