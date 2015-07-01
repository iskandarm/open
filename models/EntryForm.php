<?php

namespace app\models;

use Yii;

use yii\base\Model;

class EntryForm extends Model
{
    public $name;
    public $email;
    
    
    
    public function rules(){
        return [
            [['email','name'] ,'required'],
            ['email','email'],
        ];
    }
}