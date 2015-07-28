<?php 
use yii\helpers\Html; 
$this->title = 'Master Configuration';
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="box box-default">
   
   <div class="box-body">
    <div class="row">
         <div class="col-md-4 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="fa fa-stethoscope"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text"><?= Html::a('INSURANCE COMPANIES', ['/insurance']);?></span>
                  <span class="info-box-number"><?= app\models\InsuranceCompanies::find()->count(); ?></span>
 
                  <span class="info-box-bottom"><?= Html::a('<i class="fa fa-plus-square"></i> Create New', ['/insurance/create']); ?></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->

        <div class="col-md-4 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="fa fa-users"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text"><?= Html::a('INSURANCE USERS', ['']);?></span>
                  <span class="info-box-number"><?= app\models\ConsoleUsers::find()->where(["user_level"=>"INSU_COMP_USER"])->count(); ?></span>
                  <span class="info-box-bottom"><?= Html::a('<i class="fa fa-plus-square"></i> Create New', ['console-users/create']); ?></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->        

      <div class="col-md-4 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="fa fa-file-text"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text"><?= Html::a('INSURANCE POLICIES', ['/policies']);?></span>
                  <span class="info-box-number"><?= app\models\Policies::find()->count(); ?></span>
                  <span class="info-box-bottom"><?= Html::a('<i class="fa fa-plus-square"></i> Create New', ['/policies/create']); ?></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->   

    </div> <!-- /. End Row-->
    

</div><!-- /.box-body -->
</div>

