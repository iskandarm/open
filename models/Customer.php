<?php

namespace app\models;

use Yii;
use yii\base\Security;

/**
 * This is the model class for table "customer".
 *
 * @property integer $id
 * @property string $username
 * @property string $email
 * @property string $password
 * @property string $created_date
 * @property string $lastlogin
 *
 * @property Post[] $posts
 */
class Customer extends \yii\db\ActiveRecord
{
    
    public $password;
    
    // password encryption could work
    public function beforeSave($insert) {
        if(parent::beforeSave($insert)){
                if(isset($this->password)) 
                {
                    $security = new Security();
                    $this->password =  $security->generatePasswordHash($this->password);
                 }
                  return true;
       }
       return false;
   }
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'customer';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'email', 'password'], 'required'],
            ['created_date', 'default', 'value' => date("Y-m-d H:i:s")],
            [['created_date', 'lastlogin'], 'safe'],
            [['username'], 'string', 'max' => 100],
            [['email', 'password'], 'string', 'max' => 255],
            [['username', 'email'], 'unique', 'targetAttribute' => ['username', 'email'], 'message' => 'The combination of Username and Email has already been taken.']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Username',
            'email' => 'Email',
            'password' => 'Password',
            'created_date' => 'Created Date',
            'lastlogin' => 'Lastlogin',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPosts()
    {
        return $this->hasMany(Post::className(), ['customer_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return CustomerQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new CustomerQuery(get_called_class());
    }
    
    
    public function validatePassword($password)
    {
        return Security::validatePassword($password, $this->password);
    }


    /**
     * Generates password hash from password and sets it to the model
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->password = Security::generatePasswordHash($password);
    }
}
