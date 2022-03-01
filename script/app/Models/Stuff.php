<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Stuff extends Model
{
    protected $guarded = ['id'];

    public function stuffposition()
    {
        return $this->belongsTo(StuffPosition::class,'stuff_position_id','id');
    }
}
