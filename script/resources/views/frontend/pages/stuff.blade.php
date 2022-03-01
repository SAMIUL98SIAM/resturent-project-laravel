@extends('layouts.frontend.app')

@section('content')

    <!-- Start All Pages -->
	<div class="all-page-title page-breadcrumb">
		<div class="container text-center">
			<div class="row">
				<div class="col-lg-12">
					<h1>Stuff</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Pages -->

	<!-- Start Stuff -->
	<div class="stuff-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="heading-title text-center">
						<h2>Stuff</h2>
						<p>Lorem Ipsum is simply dummy text of the printing and typesetting</p>
					</div>
				</div>
			</div>
			<div class="row">
                <div class="col-md-4 col-sm-6">
                    <div class="our-team">
                        <div class="pic">
                            <img src="{{asset('frontend/images/stuff-img-01.jpg')}}">
                            <ul class="social">
                                <li><a href="#" class="fa fa-facebook"></a></li>
                                <li><a href="#" class="fa fa-google-plus"></a></li>
                                <li><a href="#" class="fa fa-instagram"></a></li>
                                <li><a href="#" class="fa fa-linkedin"></a></li>
                            </ul>
                        </div>
                        <div class="team-content">
                            <h3 class="title">Williamson</h3>
                            <span class="post">Web Developer</span>
                        </div>
                    </div>
                </div>

                @foreach ($stuffs as $stuff)
                <div class="col-md-4 col-sm-6">
                    <div class="our-team">
                        <div class="pic">
                            <img src="{{!empty($stuff->image) ? url('uploads/stuff_images/'.$stuff->image):url('/uploads/no_image.jpg')}}">
                            <ul class="social">
                                <li><a href="{{$stuff->facebook_link}}" class="fa fa-facebook"></a></li>
                                <li><a href="{{$stuff->google_link}}" class="fa fa-google-plus"></a></li>
                                <li><a href="{{$stuff->instagram_link}}" class="fa fa-instagram"></a></li>
                                <li><a href="{{$stuff->linkedin_link}}" class="fa fa-linkedin"></a></li>
                            </ul>
                        </div>
                        <div class="team-content">
                            <h3 class="title">{{$stuff->name}}</h3>
                            <span class="post">{{$stuff->stuffposition->sp_name}}</span>
                        </div>
                    </div>
                </div>
                @endforeach



            </div>
		</div>
	</div>
	<!-- End Stuff -->

    <!-- Start Customer Reviews -->
    @include('layouts.frontend.partials.customer-review')
    <!-- End Customer Reviews -->

@endsection


