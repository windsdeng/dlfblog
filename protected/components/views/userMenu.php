<ul>
	<li><?php if(Yii::app()->user->isGuest) echo CHtml::link('Login',array('site/login')); ?></li>
	<li><?php echo CHtml::link('Create New Post',array('post/create')); ?></li>
	<li><?php echo CHtml::link('Manage Posts',array('post/admin')); ?></li>
	<li><?php echo CHtml::link('Approve Comments',array('comment/index')) . ' (' . Comment::model()->pendingCommentCount . ')'; ?></li>
	<li><?php if(!Yii::app()->user->isGuest) echo CHtml::link(Yii::app()->user->name.'(Logout)',array('site/logout')); ?></li>
</ul>