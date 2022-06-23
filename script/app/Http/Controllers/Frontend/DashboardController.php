<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Food\AssignMenuItem;
use App\Models\Logo;
use App\Models\Slider;
use App\Models\Gallery;
use App\Models\Food\SpecialMenu;
use App\Models\Food\SpecialItem;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        $data['logo'] = Logo::first();
        $data['galleries'] = Gallery::orderBy('id','desc')->paginate(6);
        $data['sliders'] = Slider::where('status',1)->get();
        return view('frontend.index',$data);
    }


    public function dashboard()
    {
        $data['logo'] = Logo::first();

        return view('frontend.dashboard',$data);
    }
}
