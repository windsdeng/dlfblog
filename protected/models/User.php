<?php

/**
 * This is the model class for table "dlf_user".
 *
 * The followings are the available columns in table 'dlf_user':
 * @property string $id
 * @property string $username
 * @property string $nickname
 * @property string $password
 * @property string $avatar
 * @property string $salt
 * @property string $email
 * @property string $profile
 */
class User extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return User the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'dlf_user';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('username, nickname, password, avatar, salt, email', 'required'),
			array('username, password, avatar, salt, email', 'length', 'max'=>128),
			array('nickname', 'length', 'max'=>32),
			array('profile', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, username, nickname, password, avatar, salt, email, profile', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'username' => 'Username',
			'nickname' => 'Nickname',
			'password' => 'Password',
			'avatar' => 'Avatar',
			'salt' => 'Salt',
			'email' => 'Email',
			'profile' => 'Profile',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id,true);
		$criteria->compare('username',$this->username,true);
		$criteria->compare('nickname',$this->nickname,true);
		$criteria->compare('password',$this->password,true);
		$criteria->compare('avatar',$this->avatar,true);
		$criteria->compare('salt',$this->salt,true);
		$criteria->compare('email',$this->email,true);
		$criteria->compare('profile',$this->profile,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}