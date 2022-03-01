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
            <div><div>{{ isset($stuff) ? 'Edit' : 'Create New' }} Stuff</div></div>
        </div>
        <div class="page-title-actions">
            <a href="{{route('admin.stuffs.index')}}" type="button" class="btn-shadow mr-3 btn btn-primary"><i class="fas fa-backspace"></i> Back to list</a>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <form method="POST" action="{{isset($stuff)?route('admin.stuffs.update',$stuff->id):route('admin.stuffs.store')}}" enctype="multipart/form-data">
            @csrf
            @isset($stuff)
                @method('PUT')
            @endisset

            <div class="row">
                <div class="col-md-8">
                    <div class="main-card mb-3 card">
                        <div class="card-body">
                            <h5 class="card-title">Manage Stuff</h5>


                            <div class="form-group">
                                <label for="name">Name</label>
                                <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ $stuff->name ?? old('name') }}" autofocus>

                                @error('name')
                                <p class="p-2">
                                    <span class="text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                </p>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="facebook_link">Facebook Link</label>
                                <input id="facebook_link" type="text" class="form-control @error('facebook_link') is-invalid @enderror" name="facebook_link" value="{{ $stuff->facebook_link ?? old('facebook_link') }}" autofocus>

                                @error('facebook_link')
                                <p class="p-2">
                                    <span class="text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                </p>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="google_link">Google Link</label>
                                <input id="google_link" type="text" class="form-control @error('google_link') is-invalid @enderror" name="google_link" value="{{ $stuff->google_link ?? old('google_link') }}" autofocus>

                                @error('google_link')
                                <p class="p-2">
                                    <span class="text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                </p>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="instagram_link">Instagram Link</label>
                                <input id="instagram_link" type="text" class="form-control @error('instagram_link') is-invalid @enderror" name="instagram_link" value="{{ $stuff->instagram_link ?? old('instagram_link') }}" autofocus>

                                @error('instagram_link')
                                <p class="p-2">
                                    <span class="text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                </p>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="linkedin_link">Linkedin Link</label>
                                <input id="linkedin_link" type="text" class="form-control @error('linkedin_link') is-invalid @enderror" name="linkedin_link" value="{{ $stuff->linkedin_link ?? old('linkedin_link') }}" autofocus>

                                @error('linkedin_link')
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
                                <img id="showImage" src="{{!empty($stuff->image)?url('/uploads/stuff_images/'.$stuff->image):url('/uploads/no_image.jpg')}}" height="100px" width="100px;" alt="Card image cap"/>
                            </div>

                            <div class="form-group">
                                <label for="stuff_position_id">Select Stuff Position</label>

                                <select class="js-example-basic-single form-control @error('stuff_position_id') is-invalid @enderror" name="stuff_position_id" id="stuff_position_id">
                                    <option value="">Select Stuff Position</option>
                                    @foreach($stuff_positions as $stuff_position)
                                    <option value="{{$stuff_position->id}}" {{(@$stuff->stuff_position_id == $stuff_position->id)?'selected':''}}>{{$stuff_position->sp_name}}</option>
                                    @endforeach
                                    <option value=0>Set New Position</option>
                                    <input type="text" name="sp_name" class="form-control form-control-sm" placeholder="Stuff Position name" id="add_others" style="display: none;">
                                </select>

                                @error('stuff_position_id')
                                <p class="p-2">
                                    <span class="text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                </p>
                                @enderror
                            </div>
                            <button type="submit" class="btn btn-primary">
                                @isset($stuff)
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
    <script type="text/javascript">
        $(document).ready(function()
        {
            $(document).on('change','#stuff_position_id',function(){
                var stuff_position_id = $(this).val();
                if(stuff_position_id == '0')
                {
                    $('#add_others').show();
                }
                else
                {
                    $('#add_others').hide();
                }
            });
        });
    </script>

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Dropify/0.2.2/js/dropify.min.js"></script>
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

