@extends('layouts.frontend.app')

@section('content')

<!-- Start All Pages -->
<div class="all-page-title page-breadcrumb">
    <div class="container text-center">
        <div class="row">
            <div class="col-lg-12">
                <h1>Blog</h1>
            </div>
        </div>
    </div>
</div>
<!-- End All Pages -->

<!-- Start blog -->
<div class="blog-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="heading-title text-center">
                    <span>Tag</span>
                    <h3>{{ $tag->name }}</h3>
                    @if($tag->description)
                    <p>{{ $tag->description }}</p>
                    @endif
                </div>
            </div>
        </div>
        <div class="row">
            @foreach ($posts as $post)
            <div class="col-lg-4 col-md-6 col-12">
                <div class="blog-box-inner">
                    <div class="blog-img-box">
                        <img class="img-fluid" src="{{asset($post->image)}}" alt="">
                    </div>
                    <div class="blog-detail">
                        <h4>{{ $post->title }}.</h4>
                        <ul>
                            <li><span>{{ $post->user->name }}</span></li>
                            <li>|</li>
                            <li><span>{{ $post->created_at->format('M d, Y') }}</span></li>
                        </ul>
                        <p>{{ Str::limit($post->description, 80) }} </p>


                        <a class="btn btn-lg btn-circle btn-outline-new-white" href="{{ route('blog.details', ['slug' => $post->slug]) }}">Read More</a>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
        <div class="row text-center pt-5 border-top">
            {{ $posts->links() }}
        </div>
    </div>
</div>
<!-- End blog -->

@endsection


