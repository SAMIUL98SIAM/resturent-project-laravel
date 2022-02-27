<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Logo;
use App\Models\Slider;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function dashboard()
    {
        $data['logo'] = Logo::first();
        $data['sliders'] = Slider::where('status',1)->get();
        return view('frontend.dashboard',$data);
    }
}
