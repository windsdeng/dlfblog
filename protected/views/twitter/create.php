<?php
$this->breadcrumbs=array(
	'Twitters'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Twitter', 'url'=>array('index')),
	array('label'=>'Manage Twitter', 'url'=>array('admin')),
);
?>

<h1>Create Twitter</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>