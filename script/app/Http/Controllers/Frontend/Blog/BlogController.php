<?php

namespace App\Http\Controllers\Frontend\Blog;

use App\Http\Controllers\Controller;
use App\Models\Logo;
use App\Models\Category;
use App\Models\Post;
use App\Models\Tag;
use Illuminate\Http\Request;

class BlogController extends Controller
{
    public function blog()
    {
        $data['logo'] = Logo::first();
        $data['recentPosts'] = Post::with('category', 'user')->orderBy('created_at', 'DESC')->paginate(9);
        return view('frontend.blog.blog',$data);
    }
}
