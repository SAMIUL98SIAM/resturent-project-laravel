<?php

namespace App\Models\Food;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AssignMenuItem extends Model
{
    protected $guarded = ['id'];

    public function special_menu()
    {
        return $this->belongsTo(SpecialMenu::class,'special_menu_id','id');
    }

    public function special_item()
    {
        return $this->belongsTo(SpecialItem::class,'special_item_id','id');
    }
}
