<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="zh-cn" />
	<meta name="robots" content="none" />
	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/screen.css" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/print.css" media="print" />
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/ie.css" media="screen, projection" />
	<![endif]-->

	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css" />

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<body>

<div class="container" id="page">
	<?php if(Yii::app()->user->isGuest):?>
	<div id="header">
		<div id="logo"><img src="/images/admin-logo.jpg" alt="<?php echo CHtml::encode(Yii::app()->name); ?>" /></div>
	</div><!-- header -->
	<?php else: ?>
	<div id="mainmenu">
		<div class="user-bar right"><span><?php echo Yii::app()->user->username; ?></span>|<span><?php echo CHtml::link('我的帐户',array('user/view','id'=>Yii::app()->user->id)); ?></span>|<span><?php echo CHtml::link('退出',array('site/logout')); ?></span> </div>
		<?php $this->widget('zii.widgets.CMenu',array(
			'items'=>array(
				array('label'=>'网站设置', 'url'=>array('/setting/update')),
				array('label'=>'用户管理', 'url'=>array('/user/admin')),
				array('label'=>'分类管理', 'url'=>array('/category/admin')),
				array('label'=>'文章管理', 'url'=>array('/post/admin')),
				array('label'=>'标签管理', 'url'=>array('/tag/admin')),
				array('label'=>'评论管理', 'url'=>array('/comment/admin')),
				array('label'=>'友情链接', 'url'=>array('/link/admin')),
				array('label'=>'附件管理', 'url'=>array('/attachment/admin')),
			),
		)); ?>
		
		<?php endif; ?>
	</div><!-- mainmenu -->
	<?php if(isset($this->breadcrumbs)):?>
		<?php $this->widget('zii.widgets.CBreadcrumbs', array(
			'links'=>$this->breadcrumbs,
		)); ?><!-- breadcrumbs -->
	<?php endif?>

	<?php echo $content; ?>

	<div id="footer">
		Copyright &copy; <?php echo date('Y'); ?> by 林锋工作室.
		All Rights Reserved.
		Powered by <a href="http://www.dlf5.net/" rel="external">dlf.net</a>.
	</div><!-- footer -->

</div><!-- page -->

</body>
</html>
