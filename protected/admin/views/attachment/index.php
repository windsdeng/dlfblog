<?php
$this->breadcrumbs=array(
	'Attachments',
);

$this->menu=array(
	array('label'=>'Create Attachment', 'url'=>array('create')),
	array('label'=>'Manage Attachment', 'url'=>array('admin')),
);
?>

<h1>Attachments</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
