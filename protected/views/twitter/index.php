<?php
$this->breadcrumbs=array(
	'Twitters',
);

$this->menu=array(
	array('label'=>'Create Twitter', 'url'=>array('create')),
	array('label'=>'Manage Twitter', 'url'=>array('admin')),
);
?>

<h1>Twitters</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
