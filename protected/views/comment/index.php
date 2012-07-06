<?php
$this->breadcrumbs=array(
	'Comments',
);
?>

<h1>Comments</h1>
<script type="text/javascript"><!--
google_ad_client = "ca-pub-2584272689913259";
/* 评论审核 */
google_ad_slot = "1589521827";
google_ad_width = 468;
google_ad_height = 60;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
<script type="text/javascript"><!--
google_ad_client = "ca-pub-2584272689913259";
/* 评论列表底 */
google_ad_slot = "1780221464";
google_ad_width = 468;
google_ad_height = 15;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>