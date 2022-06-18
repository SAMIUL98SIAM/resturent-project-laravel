@extends('layouts.frontend.app')


@push('css')
<link rel="stylesheet" href="{{asset('frontend/css/linearicons.css')}}" />
<link rel="stylesheet" href="{{asset('frontend/css/font-awesome.min.css')}}" />
<link rel="stylesheet" href="{{asset('frontend/css/bootstrap.css')}}" />
<link rel="stylesheet" href="{{asset('frontend/css/owl.carousel.css')}}" />
<link rel="stylesheet" href="{{asset('frontend/css/main.css')}}" />
@endpush



@section('content')
<script>
    function dropMenu(){
    var dropmenu = document.getElementById('dropMenu');
        if (dropmenu.style.display === "none") {
            dropmenu.style.display = "block";
        } else {
            dropmenu.style.display = "none";
        }
        }
</script>
<style>
    @media only screen and (min-width: 790px) {
        .menu1{
            /* border: 1px solid #333; */
            margin-left: -5rem;
            }
        }
      .c1{
        color: #007bff;
      }
</style>


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

                    <div class="bottom-wrapper">
                        <div class="row">
                          <div class="col-lg-4 single-b-wrap col-md-12">
                           @guest
                                <i class="fa fa-heart-o" aria-hidden="true"></i>{{$post->likedUsers->count()}} people like this
                            @else
                            <a href="#" onclick="document.getElementById('like-form-{{$post->id}}').submit();"> <i class="fa fa-heart" aria-hidden="true" style="color: {{Auth::user()->likedPosts()->where('post_id', $post->id)->count() > 0 ? 'red' : ''}}"></i></a>
                                {{$post->likedUsers->count()}} people like this

                                <form action="{{route('post.like',$post->id)}}" method="POST" style="display: none" id="like-form-{{$post->id}}">
                                @csrf
                                </form>
                            @endguest
                          </div>
                          <div class="col-lg-4 single-b-wrap col-md-12">
                            <i class="fa fa-eye" aria-hidden="true"></i> {{$post->view_count}}
                            views
                          </div>
                          <div class="col-lg-4 single-b-wrap col-md-12">
                            <i class="fa fa-comment-o" aria-hidden="true"></i> {{$post->comments->count()}}
                            comments
                          </div>
                          <div class="row mx-1">
                            <div class="col-lg-6 single-b-wrap col-md-12 pt-4">
                              <h5>Share it on your social media account.</h5>
                             </div>
                            <div class="col-lg-6 single-b-wrap col-md-12 mt-3" id="social-links">
                              <ul class="social-icons">
                                <li>
                                  <a href="#" id="gmail-btn"
                                    ><i class="fa fa-envelope-o" aria-hidden="true" style="color: #cf3e39; font-size: 2rem"></i></a>
                                </li>
                                <li>
                                  <a href="#" id="facebook-btn"
                                    ><i class="fa fa-facebook-square" aria-hidden="true" style="color: #3b5998; font-size: 2rem"></i></a>
                                </li>
                                <li>
                                  <a href="#" id="gplus-btn"
                                    ><i class="fa fa-google-plus-square" aria-hidden="true" style="color: #dd4b39; font-size: 2rem"></i>
                                </a>
                                </li>
                                <li>
                                  <a href="#" id="twitter-btn"
                                    ><i class="fa fa-twitter-square" aria-hidden="true" style="color: #1da1f2; font-size: 2rem"></i>
                                  </a>
                                </li>
                                <li>
                                  <a href="#" id="linkedin-btn"
                                    ><i class="fa fa-linkedin-square" aria-hidden="true" style="color: #0077b5; font-size: 2rem"></i>
                                  </a>
                                </li>
                                <li>
                                  <a href="#" id="whatsapp-btn"
                                    ><i class="fa fa-whatsapp" aria-hidden="true" style="color: #25d366; font-size: 2rem"></i>
                                  </a>
                                </li>
                              </ul>
                            </div>
                            <div class="col-lg-6 single-b-wrap col-md-12 mt-3">
                              <button class="btn btn-primary" id="shareBtn" style="display: none"><i class="fa fa fa-share text-white" aria-hidden="true"></i> Share</button>
                            </div>
                          </div>
                        </div>
                    </div>

                    <!-- Start comment-sec Area -->
                    <section class="comment-sec-area pt-80 pb-80">
                        <div class="container">
                        <div class="row flex-column">
                            <h5 class="text-uppercase pb-80">{{$post->comments->count()}} Comments</h5>
                            <br />
                        @foreach ($post->comments as $comment)
                        <div class="comment">
                                <div class="comment-list">
                                <div class="single-comment justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                    <div class="thumb">
                                        <img src="{{asset('storage/user/'.$comment->user->image)}}" alt="{{$comment->user->image}}" width="50px">
                                    </div>
                                    <div class="desc">
                                        <h5><a href="#">{{$comment->user->name}}</a></h5>
                                        <p class="date">{{$comment->created_at->format('D, d M Y H:i')}}</p>
                                        <p class="comment">
                                        {{$comment->message}}
                                        </p>
                                    </div>
                                    </div>
                                    <div class="">
                                    <button class="btn-reply text-uppercase" id="reply-btn"
                                        onclick="showReplyForm('{{$comment->id}}','{{$comment->user->name}}')">reply</button
                                    >
                                    </div>
                                </div>
                                </div>
                            @if($comment->replies->count() > 0)
                                @foreach ($comment->replies as $reply)
                                <div class="comment-list left-padding">
                                <div
                                    class="single-comment justify-content-between d-flex"
                                >
                                    <div class="user justify-content-between d-flex">
                                    <div class="thumb">
                                        <img src="{{asset('storage/user/'.$reply->user->image)}}" alt="{{$reply->user->image}}" width="50px"/>
                                    </div>
                                    <div class="desc">
                                        <h5><a href="#">{{$reply->user->name}}</a></h5>
                                        <p class="date">{{$reply->created_at->format('D, d M Y H:i')}}</p>
                                        <p class="comment">
                                        {{$reply->message}}
                                        </p>
                                    </div>
                                    </div>
                                    <div class="">
                                    <button class="btn-reply text-uppercase" id="reply-btn"
                                        onclick="showReplyForm('{{$comment->id}}','{{$reply->user->name}}')">reply</button
                                    >
                                    </div>
                                </div>
                                </div>

                                @endforeach
                            @else
                            @endif
                                {{-- When user login show reply fourm --}}
                                @guest
                                {{-- Show none --}}
                                @else
                                <div class="comment-list left-padding" id="reply-form-{{$comment->id}}" style="display: none">
                                <div
                                    class="single-comment justify-content-between d-flex"
                                >
                                    <div class="user justify-content-between d-flex">
                                    <div class="thumb">
                                        <img src="{{asset('storage/user/'.Auth::user()->image)}}" alt="{{Auth::user()->image}}" width="50px"/>
                                    </div>
                                    <div class="desc">
                                        <h5><a href="#">{{Auth::user()->name}}</a></h5>
                                        <p class="date">{{date('D, d M Y H:i')}}</p>
                                        <div class="row flex-row d-flex">
                                        <form action="{{route('reply.store',$comment->id)}}" method="POST">
                                        @csrf
                                        <div class="col-lg-12">
                                            <textarea
                                            id="reply-form-{{$comment->id}}-text"
                                            cols="60"
                                            rows="2"
                                            class="form-control mb-10"
                                            name="message"
                                            placeholder="Messege"
                                            onfocus="this.placeholder = ''"
                                            onblur="this.placeholder = 'Messege'"
                                            required=""
                                            ></textarea>
                                        </div>
                                        <button type="submit" class="btn-reply text-uppercase ml-3">Reply</button>
                                        </form>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                                </div>
                                @endguest
                            </div>
                        @endforeach
                        </div>
                        </div>
                    </section>
                    <!-- End comment-sec Area -->

                    <!-- Start commentform Area -->
                    <section class="commentform-area pb-120 pt-80 mb-100">
                        @guest
                            <div class="container">
                                <h4>Please Sign in to post comments - <a href="{{route('login')}}">Sing in</a> or <a href="{{route('register')}}">Register</a></h4>
                            </div>
                        @else
                        <div class="container">
                        <h5 class="text-uppercas pb-50">Leave a Reply</h5>
                        <div class="row flex-row d-flex">
                            <div class="col-lg-12">
                                <form action="{{route('comment.store', $post->id)}}" method="POST">
                                    @csrf
                                <textarea
                                    class="form-control mb-10"
                                    name="message"
                                    placeholder="Messege"
                                    onfocus="this.placeholder = ''"
                                    onblur="this.placeholder = 'Messege'"
                                    required=""
                                ></textarea>
                                <button type="submit" class="primary-btn mt-20" href="#">Comment</button>
                            </form>
                            </div>
                        </div>
                        </div>
                        @endguest
                    </section>
                    <!-- End commentform Area -->
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

@push('js')
<script type="text/javascript">
    function showReplyForm(commentId,user) {
      var x = document.getElementById(`reply-form-${commentId}`);
      var input = document.getElementById(`reply-form-${commentId}-text`);

      if (x.style.display === "none") {
        x.style.display = "block";
        input.innerText=`@${user} `;

      } else {
        x.style.display = "none";
      }
    }
</script>


    <script src="{{asset('frontend/js/vendor/jquery-2.2.4.min.js')}}"></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
      integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
      crossorigin="anonymous"
    ></script>
    <script src="{{asset('frontend/js/vendor/bootstrap.min.js')}}"></script>
    <script src="{{asset('frontend/js/jquery.ajaxchimp.min.js')}}"></script>
    <script src="{{asset('frontend/js/parallax.min.js')}}"></script>
    <script src="{{asset('frontend/js/owl.carousel.min.js')}}"></script>
    <script src="{{asset('frontend/js/jquery.magnific-popup.min.js')}}"></script>
    <script src="{{asset('frontend/js/jquery.sticky.js')}}"></script>
    <script src="{{asset('frontend/js/main.js')}}"></script>
@endpush



