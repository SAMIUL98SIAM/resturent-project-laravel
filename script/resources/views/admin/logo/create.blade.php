@extends('layouts.backend.app')

@section('content')
<div class="app-page-title">
    <div class="page-title-wrapper">
        <div class="page-title-heading">
            <div class="page-title-icon">
                <i class="pe-7s-check icon-gradient bg-mean-fruit">
                </i>
            </div>
            <div><div>Create Logo</div></div>
        </div>
        <div class="page-title-actions">
            <a href="{{route('admin.logos.index')}}" type="button" class="btn-shadow mr-3 btn btn-primary"><i class="fas fa-backspace"></i> Back to list</a>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="main-card mb-3 card">
            <form method="POST" action="{{isset($role)?route('admin.logos.update',$role->id):route('admin.logos.store')}}">
            @csrf
            @isset($role)
                @method('PUT')
            @endisset
            <div class="card-body">
                <h5 class="card-title">Manage Logo</h5>

                <div class="form-group">
                    <label for="image">Image</label>
                    <input type="file" name="image" @isset($user) class="form-control @error('image') is-invalid @enderror" @endisset id="image">

                    @error('image')
                    <p class="p-2">
                        <span class="text-danger" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    </p>
                    @enderror
                </div>

                <div class="form-group" style="text-align: center;">
                    <img id="showImage" src="{{!empty(Auth::user()->image)?url('/uploads/logo_images/'.Auth::user()->image):url('/uploads/no_image.jpg')}}" height="300px" width="300px;" alt="Card image cap"/>
                </div>

                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-plus-circle"></i>
                    <span>Store</span>
                </button>
            </div>
            </form>
        </div>
    </div>
</div>
@endsection

@push('js')
{{-- image proccessing --}}
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

