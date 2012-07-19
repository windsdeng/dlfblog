<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.

$backend=dirname(dirname(__FILE__));
$frontend=dirname($backend);
Yii::setPathOfAlias('backend', $backend);

//$frontendArray=require($frontend.'/config/main.php');

return array(
    'basePath'=>$frontend,
    'controllerPath' => $backend.'/controllers',
    'viewPath' => $backend.'/views',
    'runtimePath' => $backend.'/runtime',
	'name'=>'DLFBLOG BACKEND',
	'defaultController'=>'home',
	// preloading 'log' component
        'preload'=>array('log'),

	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
        'application.components.*',
        'application.extensions.*',
        'backend.models.*',
        'backend.components.*',
	),

        'modules'=>array(
		// uncomment the following to enable the Gii tool
		'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>'123456',
		 	// If removed, Gii defaults to localhost only. Edit carefully to taste.
			'ipFilters'=>array('127.0.0.1','::1'),
		),

	),

	// application components
	'components'=>array(
		'assetManager'=>array(
			'newDirMode'=>0755,
			'newFileMode'=>0644,	
		),	
		'user'=>array(
			// enable cookie-based authentication
			'allowAutoLogin'=>true,
		),
            
		// uncomment the following to enable URLs in path-format
		/**'urlManager'=>array(
			'urlFormat'=>'path',
			'rules'=>array(
				'<controller:\w+>/<id:\d+>'=>'<controller>/view',
				'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
			),
		),**/
            
		// uncomment the following to use a MySQL database
		'db'=>require($frontend.'/config/dlfdb.php'),
		
		'errorHandler'=>array(
			// use 'site/error' action to display errors
                 'errorAction'=>'site/error',
        ),
		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
				// uncomment the following to show log messages on web pages
				
				array(
					'class'=>'CWebLogRoute',
				),
				
			),
		),
	),

);
