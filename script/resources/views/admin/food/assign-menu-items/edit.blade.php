@extends('layouts.backend.app')




@section('content')
<div class="app-page-title">
    <div class="page-title-wrapper">
        <div class="page-title-heading">
            <div class="page-title-icon">
                <i class="pe-7s-check icon-gradient bg-mean-fruit">
                </i>
            </div>
            <div><div>Edit Special Menu Item</div></div>
        </div>
        <div class="page-title-actions">
            <a href="{{route('admin.food.assign-menu-items.index')}}" type="button" class="btn-shadow mr-3 btn btn-primary"><i class="fas fa-backspace"></i> Back to list</a>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="main-card mb-3 card">
            <form method="POST" action="{{route('admin.food.assign-menu-items.update',$editAssignMenuItem[0]->special_menu_id)}}" enctype="multipart/form-data">
                @csrf
                <div class="add_item">
                    <div class="card-body">
                        <h5 class="card-title">Manage Special Menus</h5>
                        <div class="form-group col-md-4">
                            <label for="name">Name</label>
                            <select name="special_menu_id" class="js-example-basic-single form-control @error('special_menu_id') is-invalid @enderror">
                                <option value="">Select Special Menu</option>
                                @foreach ($specialMenus as $specialMenu)
                                    <option value="{{$specialMenu->id}}" {{$editAssignMenuItem[0]->special_menu_id==$specialMenu->id?"selected":""}}>{{$specialMenu->name}}</option>
                                @endforeach
                            </select>
                            @error('special_menu_id')
                            <p class="p-2">
                                <span class="text-danger" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            </p>
                            @enderror
                        </div>
                        @foreach ($editAssignMenuItem as $assignMenuItem)
                        <div class="delete_whole_extra_item_add" id="delete_whole_extra_item_add">
                            <div class="form-row">
                                <div class="form-group col-md-2">
                                    <lebel>Special Items</lebel>
                                    <select name="special_item_id[]" class="js-example-basic-single form-control-sm" required>
                                        <option value="">Select Special Items</option>
                                        @foreach ($specialItems as $specialItem)
                                        <option value="{{$specialItem->id}}" {{$assignMenuItem->special_item_id==$specialItem->id? "selected":""}}>{{$specialItem->name}}</option>
                                    @endforeach
                                    </select>
                                </div>
                                <div class="form-group col-md-2">
                                    <lebel>Price</lebel>
                                    <input type="number" name="price[]" value="{{$assignMenuItem->price}}" class="form-control form-control-sm" required>
                                </div>
                                <div class="form-group col-md-3">
                                    <lebel>Description</lebel>
                                    <input type="text" name="description[]" value="{{$assignMenuItem->description}}"  class="form-control form-control-sm" required>
                                </div>

                                <div class="form-group col-md-2" style="padding-top: 24px;">
                                    <span class="btn btn-success addeventmore"><i class="fa fa-plus-circle"></i></span>
                                    <span class="btn btn-danger removeeventmore"><i class="fa fa-minus-circle"></i></span>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-arrow-circle-up"></i>
                            <span>Update</span>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>





<div style="visibility: hidden;">
    <div class="whole_extra_item_add" id="whole_extra_item_add">
        <div class="delete_whole_extra_item_add" id="delete_whole_extra_item_add">
            <div class="card-body">
                <div class="form-row">
                    <div class="form-group col-md-2">
                        <lebel>Special Items</lebel>
                        <select name="special_item_id[]" class="form-control" required>
                            <option value="">Select Special Items</option>
                            @foreach ($specialItems as $specialItem)
                            <option value="{{$specialItem->id}}" {{$assignMenuItem->special_item_id==$specialItem->id?"selected":""}}>{{$specialItem->name}}</option>
                        @endforeach
                        </select>
                    </div>
                    <div class="form-group col-md-1">
                        <lebel>Price</lebel>
                        <input type="number" name="price[]" value="{{$assignMenuItem->price}}" class="form-control form-control-sm" required>
                    </div>
                    <div class="form-group col-md-2">
                        <lebel>Description</lebel>
                        <input type="text" name="description[]" value="{{$assignMenuItem->description}}" class="form-control form-control-sm" required>
                    </div>
                    <div class="form-group col-md-2" style="padding-top: 23px;">
                        <div class="form-row">
                            <span class="btn btn-success addeventmore"><i class="fa fa-plus-circle"></i></span>
                            <span class="btn btn-danger removeeventmore"><i class="fa fa-minus-circle"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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

    <script type="text/javascript">
        $(document).ready(function(){
            var counter = 0 ;
            $(document).on("click",".addeventmore",function(){
                var whole_extra_item_add = $("#whole_extra_item_add").html();
                $(this).closest(".add_item").append(whole_extra_item_add);
                counter++;
            });
            $(document).on("click",".removeeventmore",function(event){
                $(this).closest(".delete_whole_extra_item_add").remove();
                counter-=1;
            });
        });
    </script>
@endpush




