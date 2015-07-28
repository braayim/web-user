<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\assets;

use yii\web\AssetBundle;

/**
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class DashAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        //'css/bootstrap.min.css',
        '//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css',
        '//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css',
        'css/AdminLTE.css',
        'css/_all-skins.min.css',
        'plugins/iCheck/flat/blue.css',
        'css/site.css',
    ];
    public $js = [
        'js/bootstrap.min.js',
        '//code.jquery.com/ui/1.11.4/jquery-ui.min.js',
        'js/jquery.sparkline.min.js',
        'js/jquery.slimscroll.min.js',
        'js/fastclick.min.js',
        'js/app.min.js',
        'js/dash.js',
    ];

    public $depends = [
        'yii\web\JqueryAsset',
        'yii\bootstrap\BootstrapAsset',
        'yii\web\YiiAsset', 
        
        //'yii\bootstrap\BootstrapPluginAsset',
    ];
     public $jsOptions = [
            'position' => \yii\web\View::POS_HEAD
    ];
}
