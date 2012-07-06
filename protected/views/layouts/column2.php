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
			<script type="text/javascript"><!--
			google_ad_client = "ca-pub-2584272689913259";
			/* 博客标签页面右边 */
			google_ad_slot = "7520467082";
			google_ad_width = 336;
			google_ad_height = 280;
			//-->
			</script>
			<script type="text/javascript"
			src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			</script>
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