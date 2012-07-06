<?php $this->beginContent('/layouts/main'); ?>
<div class="container">
	<div class="secondary-content">
		<div id="leftbar">
			<h2>Editor's picks</h2>
			<?php $this->widget('EditorsPicks', array(
				
			)); ?>
			<div class="left-ad">
				<script type="text/javascript"><!--
				google_ad_client = "ca-pub-2584272689913259";
				/* 博客首页左边160&#42;600 */
				google_ad_slot = "7263844814";
				google_ad_width = 160;
				google_ad_height = 600;
				//-->
				</script>
				<script type="text/javascript"
				src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script>
			</div>
			<div class="left-ad">
			<script type="text/javascript"><!--
			google_ad_client = "ca-pub-2584272689913259";
			/* 博客首页左边160&#42;90 */
			google_ad_slot = "2523534211";
			google_ad_width = 160;
			google_ad_height = 90;
			//-->
			</script>
			<script type="text/javascript"
			src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			</script>
			</div>
		</div><!-- content -->
	</div>
	<div class="main-content">
		<div id="content">
			<?php echo $content; ?>
		</div><!-- content -->
	</div>
	<div class="promo-content">
		<div id="sidebar">
		
		<div class="search">
			<form action="http://www.dlf5.com/search" id="cse-search-box">
			  <div>
			    <input type="hidden" name="cx" value="partner-pub-2584272689913259:3000131576" />
			    <input type="hidden" name="ie" value="UTF-8" />
			    <input type="text" name="q" size="36" />
			    <input type="submit" name="sa" value="&#x641c;&#x7d22;" />
			  </div>
			</form>
			<script type="text/javascript" src="http://www.google.com.hk/coop/cse/brand?form=cse-search-box&amp;lang=zh-Hans"></script>
		</div>
		
		<h2>About this blog</h2>
		<div class="right-ad">
			<script type="text/javascript"><!--
			google_ad_client = "ca-pub-2584272689913259";
			/* 博客右边 */
			google_ad_slot = "2558217315";
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