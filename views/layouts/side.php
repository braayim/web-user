<?php
use yii\helpers\Html;
use yii\helpers\Url;
?>

   <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="images/profile.jpg" class="img-circle" alt="User Image" />

            </div>
            <div class="pull-left info">
              <p>Username</p>
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
          <!-- search form -->
          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search..." />
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-user"></i> <span>MY ACCOUNT</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="fa fa-circle-o"></i> Account</a></li>
                <li><a href="#"><i class="fa fa-circle-o"></i> Update Account</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-users"></i>
                <span>Users Panel</span>
                <span class="label label-primary pull-right">4</span>
              </a>
              <ul class="treeview-menu">
                <li><a href="<?= Url::to(['/user/admin/index']); ?>"><i class="fa fa-circle-o"></i> Manage Users</a></li>
                <li><a href="<?= Url::to(['/user/admin/create']); ?>"><i class="fa fa-circle-o"></i> New User</a></li>
                <li><a href="#"><i class="fa fa-circle-o"></i> New Role</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-laptop"></i>
                <span>Settings</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="<?= Url::to(['/estate/create']); ?>"><i class="fa fa-circle-o"></i> Add Estate</a></li>
                <li><a href="<?= Url::to(['/estate-pics/create']); ?>"><i class="fa fa-circle-o"></i> Add Photos</a></li>
                <li><a href="#"><i class="fa fa-circle-o"></i> Change Something</a></li>
                <li><a href=""><i class="fa fa-circle-o"></i> Change Items</a></li>
              </ul>
            </li>
            <li class="treeview" id="insurance">
              <a href="#">
                <i class="fa fa-table"></i> <span>Insurance</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li id="insurance_create"><a href="<?= Url::to(['/insurance/create']); ?>"><i class="fa fa-circle-o"></i>Add Company</a></li>
                <li id="policies"><a href="<?= Url::to(['/policies']); ?>"><i class="fa fa-circle-o"></i> Policies</a></li>
                <li id="payments"><a href="<?= Url::to(['/house-class-pics/create']); ?>"><i class="fa fa-circle-o"></i> Payments</a></li>

              </ul>
            </li>
            <li class="treeview" id="ura">
              <a href="#">
                <i class="fa fa-pie-chart"></i>
                <span>URA</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                 <li id="ura_create"><a href="<?= Url::to(['/ura-firstime-reg/create']); ?>"><i class="fa fa-circle-o"></i> Register</a></li>
                <li id="ura_index"><a href="<?= Url::to(['/ura-firstime-reg']); ?>"><i class="fa fa-circle-o"></i> First Time Registrations</a></li>
                <li id="ura_stampduty"><a href="<?= Url::to(['/ura-stampduty-prn-reg']); ?>"><i class="fa fa-circle-o"></i> Stamp Duty Prn</a></li>
              </ul>
            </li>

            
            <li class="treeview">
              <a href="#">
                <i class="fa fa-edit"></i> <span>Neon</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="fa fa-circle-o"></i> Action 1s</a></li>
                <li><a href="#"><i class="fa fa-circle-o"></i> Action 2</a></li>
                <li><a href="#"><i class="fa fa-circle-o"></i> Action 3</a></li>
              </ul>
            </li>
            <li id="messages">
              <a>
                <i class="fa fa-envelope"></i> <span>Messages</span>
                <?php
                $unread = app\models\Inbox::find()->where(['read'=>false])->count();
                if($unread > 0){
                ?>
                <small class="label pull-right bg-red"><?= $unread?></small>
                <?php } ?>
              </a>
              <ul class="treeview-menu">
                <li id="inbox"><a href="<?= Url::to(['/inbox']); ?>"><i class="fa fa-circle-o"></i> Inbox
                <? if($unread > 0){?>
                <small class="label pull-right bg-yellow"><?= $unread?></small>
                <?php } ?></a></li>

                <li id="outbox"><a href="<?= Url::to(['/outbox']); ?>"><i class="fa fa-circle-o"></i> Outbox
                   <? 
                   $outbox = app\models\MessageOutbox::find()->count();
                  if($outbox > 0){?>
                <small class="label pull-right bg-yellow"><?= $outbox ?></small>
                <?php } ?>
                </a></li>
              </ul>
            </li>
            <li>
              <a href="pages/calendar.html">
                <i class="fa fa-calendar"></i> <span>Calendar</span>
                <small class="label pull-right bg-red">3</small>
              </a>
            </li>
           
           
            <li><a href="documentation/index.html"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
            <li class="header">LABELS</li>
            <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>