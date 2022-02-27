<div id="slides" class="cover-slides">
    <ul class="slides-container">
        @foreach ($sliders as $slider)
        <li class="text-left">
            <img src="{{!empty($slider->image)?url('uploads/slider_images/'.$slider->image):url('/uploads/no_image.jpg/')}}" alt="">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="m-b-20"><strong>Welcome To <br> {{$slider->short_title}}</strong></h1>
                        <p class="m-b-40">{{$slider->long_title}}  <br>
                            {{$slider->long_title_o}}</p>
                        <p><a class="btn btn-lg btn-circle btn-outline-new-white" href="#">Reservation</a></p>
                    </div>
                </div>
            </div>
        </li>
        @endforeach
    </ul>
    <div class="slides-navigation">
        <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
        <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
    </div>
</div>
