<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Logo;

use Illuminate\Http\Request;

class MenuController extends Controller
{
    public function menu()
    {
        $data['logo'] = Logo::first();
        return view('frontend.menu',$data);
    }
}
