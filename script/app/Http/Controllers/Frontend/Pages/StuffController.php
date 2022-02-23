<?php

namespace App\Http\Controllers\Frontend\Pages;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class StuffController extends Controller
{
    public function stuff()
    {
        return view('frontend.pages.stuff');
    }
}
