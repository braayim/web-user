<?php

return [
    'class' => 'yii\db\Connection',
    'dsn' => 'pgsql:host=195.168.20.5;dbname=thirdparty_payments_db', 
    'username' => 'sandbox',
    'password' => 'sandbox',
    'charset' => 'utf8',
    'schemaMap' => [
      'pgsql'=> [
        'class'=>'yii\db\pgsql\Schema',
        'defaultSchema' => 'public' //specify your schema here
      ]
    ], // PostgreSQL
];
