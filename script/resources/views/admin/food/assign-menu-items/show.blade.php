@extends('layouts.backend.app')

@push('css')
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="{{asset('backend/css/datatable.css')}}">
@endpush


@section('content')
<div class="app-page-title">
    <div class="page-title-wrapper">
        <div class="page-title-heading">
            <div class="page-title-icon">
                <i class="pe-7s-check icon-gradient bg-mean-fruit">
                </i>
            </div>
            <div>Assign Special Items Details</div>
        </div>
        <div class="page-title-actions">
            <a href="{{route('admin.food.assign-menu-items.index')}}" type="button" class="btn-shadow mr-3 btn btn-primary"><i class="fas fa-backspace"></i> Back to list</a>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="main-card mb-3 card">
            <div class="table-responsive">
                <table id="datatable" class="align-middle mb-0 table table-borderless table-striped table-hover">
                    <thead>
                        <tr>
                            <th class="text-center">SL.</th>
                            <th class="text-center">Special Item Name</th>
                            <th class="text-center">Image</th>
                            <th class="text-center">Price</th>
                            <th class="text-center">Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($assignMenuItem as $key=>$assignMenuItem)
                        <tr>
                            <td class="text-center">{{$key+1}}</td>
                            <td class="text-center">{{$assignMenuItem->special_item->name}}</td>
                            <td class="text-center">
                                <img width="40" class="rounded-circle"
                                src="{{!empty($assignMenuItem->special_item->image)?url('/uploads/special_item_images/'.$assignMenuItem->special_item->image):url('/uploads/no_image.jpg')}}" alt="Special Item Pic">
                            </td>
                            <td class="text-center">{{$assignMenuItem->price}}</td>
                            <td class="text-center">{{$assignMenuItem->description}}</</td>
                        </tr>
                        @endforeach

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')
<!-- Datatable -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
@endpush
