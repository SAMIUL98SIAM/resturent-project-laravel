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
            <div>Assign Special Items</div>
        </div>
        <div class="page-title-actions">
            <a href="{{route('admin.food.assign-menu-items.create')}}" type="button" class="btn-shadow mr-3 btn btn-primary"><i class="fa fa-plus"></i> Create Special Item</a>
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
                            <th class="text-center">#</th>
                            <th class="text-center">Special Menu Name</th>
                            <th class="text-center">Created At</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($assignMenuItems as $key=>$assignMenuItem)
                        <tr>
                            <td class="text-center text-muted">{{$key+1}}</td>

                            <td class="text-center">{{$assignMenuItem->special_menu->name}}</td>

                            <td class="text-center">{{$assignMenuItem->created_at->diffForHumans()}}</td>
                            <td class="text-center">
                                <a href="{{route('admin.food.special-items.edit',$assignMenuItem->special_menu_id)}}" class="btn btn-primary btn-sm"><i class="fa fa-edit"><span> Edit</span></i></a>

                                <button type="button" class="btn btn-danger btn-sm"onclick="deleteData({{ $assignMenuItem->special_menu_id }})"><i class="fas fa-trash-alt"></i><span>Delete</span></button>
                                <form id="delete-form-{{ $assignMenuItem->special_menu_id }}"
                                action="{{ route('admin.food.special-items.destroy',$assignMenuItem->special_menu_id) }}" method="POST"
                                style="display: none;">
                                @csrf()
                                @method('DELETE')
                                </form>


                            </td>
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
<script>
    $(document).ready(function() {
    $('#datatable').DataTable();
    } );
</script>

<!-- Sweet Alert -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
@endpush
