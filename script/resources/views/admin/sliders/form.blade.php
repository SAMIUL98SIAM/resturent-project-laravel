@extends('layouts.backend.app')

@push('css')
    <link rel="stylesheet" href="{{asset('backend/dropify/sass/dropify.scss')}}">
    <link rel="stylesheet" href="{{asset('backend/dropify/sass/demo.scss')}}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Dropify/0.2.2/css/dropify.min.css" integrity="sha512-EZSUkJWTjzDlspOoPSpUFR0o0Xy7jdzW//6qhUkoZ9c4StFkVsp9fbbd0O06p9ELS3H486m4wmrCELjza4JEog==" crossorigin="anonymous" referrerpolicy="no-referrer" />
@endpush

@section('content')
<div class="app-page-title">
    <div class="page-title-wrapper">
        <div class="page-title-heading">
            <div class="page-title-icon">
                <i class="pe-7s-users icon-gradient bg-mean-fruit">
                </i>
            </div>
            <div><div>{{ isset($slider) ? 'Edit' : 'Create New' }} Slider</div></div>
        </div>
        <div class="page-title-actions">
            <a href="{{route('admin.sliders.index')}}" type="button" class="btn-shadow mr-3 btn btn-primary"><i class="fas fa-backspace"></i> Back to list</a>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <form method="POST" action="{{isset($slider)?route('admin.sliders.update',$slider->id):route('admin.sliders.store')}}" enctype="multipart/form-data">
            @csrf
            @isset($slider)
                @method('PUT')
            @endisset

            <div class="row">
                <div class="col-md-8">
                    <div class="main-card mb-3 card">
                        <div class="card-body">
                            <h5 class="card-title">Manage Slider</h5>

                            <div class="form-group">
                                <label for="short_title">Short Description</label>
                                <input id="short_title" type="text" class="form-control @error('short_title') is-invalid @enderror" name="short_title" value="{{ $slider->short_title ?? old('short_title') }}" autofocus>

                                @error('short_title')
                                <p class="p-2">
                                    <span class="text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                </p>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="long_title">Long Description</label>
                                <input id="long_title" type="text" class="form-control @error('long_title') is-invalid @enderror" name="long_title" value="{{ $slider->long_title ?? old('long_title') }}" autofocus>

                                @error('long_title')
                                <p class="p-2">
                                    <span class="text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                </p>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="long_title_o">Long Description</label>
                                <input id="long_title_o" type="text" class="form-control @error('long_title_o') is-invalid @enderror" name="long_title_o" value="{{ $slider->long_title_o ?? old('long_title_o') }}" autofocus>

                                @error('long_title_o')
                                <p class="p-2">
                                    <span class="text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                </p>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="avatar">Avatar</label>
                                <input type="file" id="image" name="image" class="dropify form-control @error('image') is-invalid @enderror">
                                @error('image')
                                <p class="p-2">
                                    <span class="text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                </p>
                                @enderror
                            </div>

                            <div class="form-group" style="text-align: center;">
                                <img id="showImage" src="{{!empty($slider->image)?url('/uploads/slider_images/'.$slider->image):url('/uploads/no_image.jpg')}}" height="300px" width="300px;" alt="Card image cap"/>
                            </div>
                            <button type="submit" class="btn btn-primary">
                                @isset($slider)
                                <i class="fas fa-arrow-circle-up"></i>
                                <span>Update</span>
                                @else
                                <i class="fas fa-plus-circle"></i>
                                <span>Store</span>
                                @endisset
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection

@push('js')

    <!-- Select 2 --->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.js-example-basic-single').select2();
        });
    </script>
    <!-- Dropify -->
    <script src="{{asset('backend/dropify/js/dropify.js')}}"></script>
    <!-- Dropify -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Dropify/0.2.2/js/dropify.min.js" integrity="sha512-8QFTrG0oeOiyWo/VM9Y8kgxdlCryqhIxVeRpWSezdRRAvarxVtwLnGroJgnVW9/XBRduxO/z1GblzPrMQoeuew==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script type="text/javascript">
        $('.dropify').dropify();
    </script>
     <script type="text/javascript">
        $(document).ready(function(){
            $('#image').change(function(e){
                var reader = new FileReader();
                reader.onload = function(e)
                {
                    $('#showImage').attr('src',e.target.result);
                }
                reader.readAsDataURL(e.target.files['0']);
            });
        });
    </script>
@endpush

