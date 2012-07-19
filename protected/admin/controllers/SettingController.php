<?php

class SettingController extends Controller
{
	public function actionUpdate()
	{
		$model = new SettingForm;
		foreach ($this->settings as $key => $value) {
			$model->$key = $value;
		}
		
		if(isset($_POST['SettingForm']))
		{
			$model->attributes=$_POST['SettingForm'];
			if($model->validate())
			{
				$option_value = json_encode($model->attributes);
				$option_name = 'settings';
				//TODO 未完成
				$this->refresh();
			}
		}
		
		$this->render('update',array(
			'model'=>$model,
		));
	}

}