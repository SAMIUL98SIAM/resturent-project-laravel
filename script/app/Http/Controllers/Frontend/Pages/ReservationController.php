<?php

namespace App\Http\Controllers\Frontend\Pages;

use App\Http\Controllers\Controller;
use App\Models\Logo;
use Illuminate\Http\Request;

class ReservationController extends Controller
{
    public function reservation()
    {
        $data['logo'] = Logo::first();
        return view('frontend.pages.reservation',$data);
    }
}
