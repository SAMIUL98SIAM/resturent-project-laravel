<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Logo;
use App\Models\Slider;
use Illuminate\Http\Request;

class MenuController extends Controller
{
    public function menu()
    {
        return view('frontend.menu');
    }
}
