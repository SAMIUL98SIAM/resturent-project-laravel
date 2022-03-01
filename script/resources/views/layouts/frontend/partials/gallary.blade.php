<div class="gallery-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="heading-title text-center">
                    <h2>Gallery</h2>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting</p>
                </div>
            </div>
        </div>
        <div class="tz-gallery">
            <div class="row">
                @foreach ($galleries as $gallery)
                <div class="col-sm-12 col-md-4 col-lg-4">
                    <a class="lightbox" href="{{!empty($gallery->image)?url('uploads/gallery_images/'.$gallery->image):url('/uploads/no_image.jpg/')}}">
                        <img class="img-fluid" src="{{!empty($gallery->image)?url('uploads/gallery_images/'.$gallery->image):url('/uploads/no_image.jpg/')}}" alt="Gallery Images">
                    </a>
                </div>
                @endforeach
            </div>
            {{$galleries->links()}}
        </div>
    </div>
</div>
