<?php

namespace App\Http\Controllers\Frontend\Pages;

use App\Http\Controllers\Controller;
use App\Models\Logo;
use Illuminate\Http\Request;

class GalleryController extends Controller
{
    public function gallery()
    {
        $data['logo'] = Logo::first();
        return view('frontend.pages.gallery',$data);
    }
}
