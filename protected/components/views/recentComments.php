<ul>
	<?php foreach($this->getRecentComments() as $comment): ?>
	<li><?php echo $comment->authorLink; ?> on
		<?php echo CHtml::link(CHtml::encode($comment->post->title), $comment->getUrl()); ?>
	</li>
	<?php endforeach; ?>
</ul>

<script type="text/javascript"><!--
google_ad_client = "ca-pub-2584272689913259";
/* 最近的评论180&#42;90 */
google_ad_slot = "5658453915";
google_ad_width = 180;
google_ad_height = 90;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>

<script type="text/javascript"><!--
google_ad_client = "ca-pub-2584272689913259";
/* 最近的评论120&#42;90 */
google_ad_slot = "2339865623";
google_ad_width = 120;
google_ad_height = 90;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>