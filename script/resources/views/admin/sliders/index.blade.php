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
                <i class="pe-7s-users icon-gradient bg-mean-fruit">
                </i>
            </div>
            <div>Users</div>
        </div>
        <div class="page-title-actions">
            <a href="{{route('admin.sliders.create')}}" type="button" class="btn-shadow mr-3 btn btn-primary"><i class="fa fa-plus"></i> Create User</a>
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
                            <th>Slider Images</th>
                            <th>Short Description</th>
                            <th>Long Description 1</th>
                            <th>Long Description 2</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($sliders as $key=>$slider)
                        <tr>
                            <td class="text-center text-muted">{{$key+1}}</td>
                            <td><img src="{{!empty($slider->image) ? url('uploads/slider_images/'.$slider->image):url('/uploads/no_image.jpg')}}" width="120px" height="130px"></td>
                            <td width="10%" class="text-center">{{$slider->short_title}}</td>
                            <td width="20%" class="text-center">{{$slider->long_title}}</td>
                            <td width="20%" class="text-center">{{$slider->long_title_o}}</td>
                            <td width="30%" class="text-center">
                                <a title="Edit" href="{{route('admin.sliders.edit',$slider->id)}}" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i> <span>Edit</span></a>
                                @if ($slider->status == 1)
                                <a href="{{route('admin.sliders.unactivate',$slider->id)}}" class="btn btn-sm btn-success">Unactivate</a>
                                @else
                                <a href="{{route('admin.sliders.activate',$slider->id)}}" class="btn btn-sm btn-warning">Activate</a>
                                @endif
                                <button type="button" class="btn btn-danger btn-sm"
                                            onclick="deleteData({{ $slider->id }})">
                                        <i class="fas fa-trash-alt"></i>
                                        <span>Delete</span>
                                    </button>
                                <form id="delete-form-{{ $slider->id }}" action="{{ route('admin.sliders.destroy',$slider->id) }}" method="POST" style="display: none;">
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
