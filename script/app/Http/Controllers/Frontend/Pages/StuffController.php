<?php

namespace App\Http\Controllers\Frontend\Pages;

use App\Http\Controllers\Controller;
use App\Models\Logo;
use App\Models\Stuff;
use Illuminate\Http\Request;

class StuffController extends Controller
{
    public function stuff()
    {
        $data['logo'] = Logo::first();
        $data['stuffs'] = Stuff::orderBy('id','desc')->paginate(3);
        return view('frontend.pages.stuff',$data);
    }
}
