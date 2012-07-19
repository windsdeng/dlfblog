<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'attachment-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'post_id'); ?>
		<?php echo $form->textField($model,'post_id',array('size'=>11,'maxlength'=>11)); ?>
		<?php echo $form->error($model,'post_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'filename'); ?>
		<?php echo $form->textField($model,'filename',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'filename'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'filesize'); ?>
		<?php echo $form->textField($model,'filesize',array('size'=>11,'maxlength'=>11)); ?>
		<?php echo $form->error($model,'filesize'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'filepath'); ?>
		<?php echo $form->textField($model,'filepath',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'filepath'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'created'); ?>
		<?php echo $form->textField($model,'created',array('size'=>11,'maxlength'=>11)); ?>
		<?php echo $form->error($model,'created'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'updated'); ?>
		<?php echo $form->textField($model,'updated',array('size'=>11,'maxlength'=>11)); ?>
		<?php echo $form->error($model,'updated'); ?>
	</div>

	<div class="row buttons">
		<?php $this->widget('zii.widgets.jui.CJuiButton', array(
			     	'name'=>'submit',
			  		'caption'=>$model->isNewRecord ? 'Create' : 'Save',
			  		'options'=>array(
			          	'onclick'=>'js:function(){alert("Yes");}',
		  		),
		  ));
		?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->