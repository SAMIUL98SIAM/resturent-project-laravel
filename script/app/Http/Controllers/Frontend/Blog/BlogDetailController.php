<?php

namespace App\Http\Controllers\Frontend\Blog;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class BlogDetailController extends Controller
{
    public function blog_detail()
    {
        return view('frontend.blog.blog-detail');
    }
}
