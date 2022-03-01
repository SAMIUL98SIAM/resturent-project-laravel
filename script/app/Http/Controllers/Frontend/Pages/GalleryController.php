<?php

namespace App\Http\Controllers\Frontend\Pages;

use App\Http\Controllers\Controller;
use App\Models\Logo;
use App\Models\Gallery;
use Illuminate\Http\Request;

class GalleryController extends Controller
{
    public function gallery()
    {
        $data['logo'] = Logo::first();
        $data['galleries'] = Gallery::orderBy('id','desc')->paginate(6);
        return view('frontend.pages.gallery',$data);
    }
}
