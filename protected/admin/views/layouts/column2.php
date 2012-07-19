<?php $this->beginContent('//layouts/main'); ?>
<div class="container">
		<div id="left-sidebar">
			<div id="sidebar">
			<?php
				$this->beginWidget('zii.widgets.CPortlet', array(
					'title'=>'Operations',
				));
				$this->widget('zii.widgets.CMenu', array(
					'items'=>$this->menu,
					'htmlOptions'=>array('class'=>'operations'),
				));
				$this->endWidget();
			?>
			</div><!-- sidebar -->
		</div>
		<div id="main-content">
			<div id="content">
				<?php echo $content; ?>
			</div><!-- content -->
		</div>
</div>
<?php $this->endContent(); ?>