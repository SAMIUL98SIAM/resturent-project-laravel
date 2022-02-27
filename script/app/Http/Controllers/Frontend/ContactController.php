<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Logo;
use Illuminate\Http\Request;

class ContactController extends Controller
{
    public function contact()
    {
        $data['logo'] = Logo::first();
        return view('frontend.contact',$data);
    }
}
