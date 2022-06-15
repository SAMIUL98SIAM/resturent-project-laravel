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

<!-- Start blog details -->
<div class="blog-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="heading-title text-center">
                    <h2>Blog</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-8 col-lg-8 col-12">
                <div class="blog-inner-details-page">
                    <div class="blog-inner-box">
                        <div class="side-blog-img">
                            <img class="img-fluid" src="{{asset($post->image)}}" alt="">
                        </div>
                        <div class="inner-blog-detail details-page">
                            <h3>{{ $post->title }}</h3>
                            <ul>
                                <li><i class="zmdi zmdi-account"></i>Posted By : <span>{{ $post->user->name }}</span></li>
                                <li>|</li>
                                <li><i class="zmdi zmdi-time"></i>Time : <span>{{ $post->created_at->format('M d, Y') }}</span></li>
                            </ul>
                            <p>{{$post->description}}</p>

                            <blockquote>
                                <p>{{$post->description_ii}}</p>
                            </blockquote>
                            <p>{{$post->description_i}}.</p>
                        </div>
                    </div>

                    {{-- <div class="blog-comment-box">
                        <h3>Comments</h3>
                        <div class="comment-item">
                            <div class="comment-item-left">
                                <img src="{{asset('frontend/images/avt-img.jpg')}}" alt="">
                            </div>
                            <div class="comment-item-right">
                                <div class="pull-left">
                                    <a href="#">Rubel Ahmed</a>
                                </div>
                                <div class="pull-right">
                                    <i class="fa fa-clock-o" aria-hidden="true"></i>Time : <span>11.30 am</span>
                                </div>
                                <div class="des-l">
                                    <p>Morbi lacinia ultrices lorem id tincidunt. Cras id dui risus. Pellentesque consectetur id mi sed pharetra. Proin imperdiet gravida nisl, sit amet varius urna. In auctor.</p>
                                </div>
                                <a href="#" class="right-btn-re"><i class="fa fa-reply" aria-hidden="true"></i> Reply</a>
                            </div>
                        </div>
                        <div class="comment-item children">
                            <div class="comment-item-left">
                                <img src="{{asset('frontend/images/avt-img.jpg')}}" alt="">
                            </div>
                            <div class="comment-item-right">
                                <div class="pull-left">
                                    <a href="#">Admin</a>
                                </div>
                                <div class="pull-right">
                                    <i class="fa fa-clock-o" aria-hidden="true"></i>Time : <span>1.30 pm</span>
                                </div>
                                <div class="des-l">
                                    <p>Morbi lacinia ultrices lorem id tincidunt. Cras id dui risus. Pellentesque consectetur id mi sed pharetra. Proin imperdiet gravida nisl, sit amet varius urna. In auctor.</p>
                                </div>
                                <a href="#" class="right-btn-re"><i class="fa fa-reply" aria-hidden="true"></i> Reply</a>
                            </div>
                        </div>
                        <div class="comment-item">
                            <div class="comment-item-left">
                                <img src="{{asset('frontend/images/avt-img.jpg')}}" alt="">
                            </div>
                            <div class="comment-item-right">
                                <div class="pull-left">
                                    <a href="#">Rubel Ahmed</a>
                                </div>
                                <div class="pull-right">
                                    <i class="fa fa-clock-o" aria-hidden="true"></i>Time : <span>11.30 am</span>
                                </div>
                                <div class="des-l">
                                    <p>Morbi lacinia ultrices lorem id tincidunt. Cras id dui risus. Pellentesque consectetur id mi sed pharetra. Proin imperdiet gravida nisl, sit amet varius urna. In auctor.</p>
                                </div>
                                <a href="#" class="right-btn-re"><i class="fa fa-reply" aria-hidden="true"></i> Reply</a>
                            </div>
                        </div>
                    </div>
                    <div class="comment-respond-box">
                        <h3>Leave your comment </h3>
                        <div class="comment-respond-form">
                            <form id="commentrespondform" class="comment-form-respond row" method="post">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <input id="name_com" class="form-control" name="name" placeholder="Name" type="text">
                                    </div>
                                    <div class="form-group">
                                        <input id="email_com" class="form-control" name="email" placeholder="Your Email" type="email">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <textarea class="form-control" id="textarea_com" placeholder="Your Message" rows="2"></textarea>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <button class="btn btn-submit">Submit comment</button>
                                </div>
                            </form>
                        </div>
                    </div> --}}
                </div>
            </div>

            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-8 col-12 blog-sidebar">
                <div class="right-side-blog">
                    <h3>Search</h3>
                    <div class="blog-search-form">
                        <input name="search" placeholder="Search blog" type="text">
                        <button class="search-btn">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </div>
                    <h3>Categories</h3>
                    <div class="blog-categories">
                        <ul>
                            @foreach($categories as $category)
                            <li><a href="{{ route('blog.categories', ['slug' => $category->slug]) }}"><span>{{$category->name}}</span></a></li>
                            @endforeach
                        </ul>
                    </div>
                    <h3>Recent Post</h3>
                    <div class="post-box-blog">
                        <div class="recent-post-box">
                            @foreach($posts as $post)
                            <div class="recent-box-blog">
                                <div class="recent-img">
                                    <img class="img-fluid" width="70px" src="{{asset($post->image)}}" alt="">
                                </div>
                                <div class="recent-info">
                                    <ul>
                                        <li><i class="zmdi zmdi-account"></i>Posted By : <span>{{ $post->user->name }}<</span></li>
                                        <li>|</li>
                                        <li><i class="zmdi zmdi-time"></i>Time : <span>{{ $post->created_at->format('M d, Y') }}</span></li>
                                    </ul>
                                    <h4><a href="{{ route('blog.details', ['slug' => $post->slug]) }}">{{ Str::limit($post->description, 50) }}</a> .</h4>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                    <h3>Recent Tag</h3>
                    <div class="blog-tag-box">
                        <ul class="list-inline tag-list">
                            @foreach($tags as $tag)
                            <li class="list-inline-item"><a href="{{ route('blog.tags', ['slug' => $tag->slug]) }}">{{$tag->name}}</a></li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- End details -->

@endsection


