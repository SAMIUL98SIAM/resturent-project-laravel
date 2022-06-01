@extends('layouts.backend.app')

@section('content')
<div class="app-page-title">
    <div class="page-title-wrapper">
        <div class="page-title-heading">
            <div class="page-title-icon">
                <i class="pe-7s-check icon-gradient bg-mean-fruit">
                </i>
            </div>
            <div><div>{{ isset($specialItem) ? 'Edit' : 'Create New' }} Special Items</div></div>
        </div>
        <div class="page-title-actions">
            <a href="{{route('admin.food.special-items.index')}}" type="button" class="btn-shadow mr-3 btn btn-primary"><i class="fas fa-backspace"></i> Back to list</a>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="main-card mb-3 card">
            <form method="POST" action="{{isset($specialItem)?route('admin.food.special-items.update',$specialItem->id):route('admin.food.special-items.store')}}" enctype="multipart/form-data">
            @csrf
            @isset($specialItem)
                @method('PUT')
            @endisset
            <div class="card-body">
                <h5 class="card-title">Manage Special Items</h5>

                <div class="form-group">
                    <label for="name">Name</label>
                    <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ $specialItem->name ?? old('name') }}" autofocus>
                    @error('name')
                    <p class="p-2">
                        <span class="text-danger" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    </p>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="image">Image</label>
                    <input type="file" id="image" name="image" class="form-control form-control-sm @error('image') is-invalid @enderror" style="margin-top: -9px;">
                    @error('image')
                    <p class="p-2">
                        <span class="text-danger" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    </p>
                    @enderror
                </div>

                <div class="form-group" style="text-align: center;">
                    <img id="showImage" src="{{!empty($specialItem->image)?url('/uploads/special_item_images/'.$specialItem->image):url('/uploads/no_image.jpg')}}" height="300px" width="300px;" alt="Card image cap"/>
                </div>


                <button type="submit" class="btn btn-primary">
                    @isset($specialItem)
                    <i class="fas fa-arrow-circle-up"></i>
                    <span>Update</span>
                    @else
                    <i class="fas fa-plus-circle"></i>
                    <span>Store</span>
                    @endisset

                </button>
            </div>
            </form>
        </div>
    </div>
</div>
@endsection

@push('js')
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

