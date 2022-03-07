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
            <form method="POST" action="{{isset($specialItem)?route('admin.food.special-items.update',$specialItem->id):route('admin.food.special-items.store')}}">
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
       function toggle(source) {
            checkboxes = document.getElementsByName('permissions[]');
            for(var i=0, n=checkboxes.length;i<n;i++) {
                checkboxes[i].checked = source.checked;
            }
        }
    </script>
@endpush

