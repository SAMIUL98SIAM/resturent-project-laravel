<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Logo;
use App\Models\Slider;
use App\Models\Gallery;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function dashboard()
    {
        $data['logo'] = Logo::first();
        $data['galleries'] = Gallery::orderBy('id','desc')->paginate(6);
        $data['sliders'] = Slider::where('status',1)->get();
        return view('frontend.dashboard',$data);
    }
}
