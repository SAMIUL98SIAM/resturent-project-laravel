<?php

namespace App\Http\Controllers\Frontend\Blog;

use App\Http\Controllers\Controller;
use App\Models\Logo;
use Illuminate\Http\Request;

class BlogController extends Controller
{
    public function blog()
    {
        $data['logo'] = Logo::first();
        return view('frontend.blog.blog',$data);
    }
}
