<?php

namespace App\Http\Controllers\Frontend\Blog;

use App\Http\Controllers\Controller;
use App\Models\Logo;
use Illuminate\Http\Request;

class BlogDetailController extends Controller
{
    public function blog_detail()
    {
        $data['logo'] = Logo::first();
        return view('frontend.blog.blog-detail',$data);
    }
}
