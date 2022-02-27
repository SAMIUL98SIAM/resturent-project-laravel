<?php

namespace App\Http\Controllers\Frontend\Pages;

use App\Http\Controllers\Controller;
use App\Models\Logo;
use Illuminate\Http\Request;

class StuffController extends Controller
{
    public function stuff()
    {
        $data['logo'] = Logo::first();
        return view('frontend.pages.stuff',$data);
    }
}
