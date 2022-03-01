<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Logo;
use App\Models\Gallery;
use Illuminate\Http\Request;

class AboutController extends Controller
{
    public function about()
    {
        $data['logo'] = Logo::first();
        $data['galleries'] = Gallery::orderBy('id','desc')->paginate(6);
        return view('frontend.about',$data);
    }
}
