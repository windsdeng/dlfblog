<?php
$this->breadcrumbs=array(
	'Twitters'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Twitter', 'url'=>array('index')),
	array('label'=>'Create Twitter', 'url'=>array('create')),
	array('label'=>'View Twitter', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Twitter', 'url'=>array('admin')),
);
?>

<h1>Update Twitter <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>