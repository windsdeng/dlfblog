<?php $this->beginContent('/layouts/main'); ?>
<div class="container">
	<div class="left-content">
		<div id="content">
			<?php echo $content; ?>
		</div><!-- content -->
	</div>
	<div class="promo-content">
		<div id="sidebar">
			<div class="right-ad">
			ads
			</div>
			<?php $this->widget('UserMenu'); ?>

			<?php $this->widget('TagCloud', array(
				'maxTags'=>Yii::app()->params['tagCloudCount'],
			)); ?>

			<?php $this->widget('RecentComments', array(
				'maxComments'=>Yii::app()->params['recentCommentCount'],
			)); ?>
		</div><!-- sidebar -->
	</div>
	<div class="clear"></div>
</div>
<?php $this->endContent(); ?>