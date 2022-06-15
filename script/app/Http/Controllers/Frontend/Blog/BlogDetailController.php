<?php

namespace App\Http\Controllers\Frontend\Blog;

use App\Http\Controllers\Controller;
use App\Models\Logo;
use App\Models\Category;
use App\Models\Post;
use App\Models\Tag;
use Illuminate\Http\Request;

class BlogDetailController extends Controller
{
    public function blog_details($slug)
    {
        $data['logo'] = Logo::first();

        $post = Post::with('category', 'user')->where('slug', $slug)->first();
        $posts = Post::with('category', 'user')->inRandomOrder()->limit(3)->get();

        $categories = Category::all();
        $tags = Tag::all();

        if($post){
            return view('frontend.blog.blog-detail', compact(['post', 'posts', 'categories', 'tags']),$data);
        }else {
            return redirect('/');
        }
    }

    public function blog_categories($slug){
        $category = Category::where('slug', $slug)->first();
        if($category){
            $posts = Post::where('category_id', $category->id)->paginate(9);

            return view('frontend.blog.blog-category', compact(['category', 'posts']));
        }else {
            return redirect()->route('/');
        }
    }

    public function blog_tags($slug){
        $tag = Tag::where('slug', $slug)->first();
        if($tag){
            $posts = $tag->posts()->orderBy('created_at', 'desc')->paginate(9);

            return view('frontend.blog.blog-tag', compact(['tag', 'posts']));
        }else {
            return redirect()->route('/');
        }
    }
}
