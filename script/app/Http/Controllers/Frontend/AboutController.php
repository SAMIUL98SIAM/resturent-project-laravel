<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Logo;
use Illuminate\Http\Request;

class AboutController extends Controller
{
    public function about()
    {$data['logo'] = Logo::first();
        return view('frontend.about',$data);
    }
}
