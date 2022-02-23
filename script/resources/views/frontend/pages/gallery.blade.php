@extends('layouts.frontend.app')

@section('content')

    <!-- Start All Pages -->
    <div class="all-page-title page-breadcrumb">
        <div class="container text-center">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Gallery</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Pages -->

    <!-- Start Gallery -->
    @include('layouts.frontend.partials.gallary')
    <!-- End Gallery -->

    <!-- Start Customer Reviews -->
    @include('layouts.frontend.partials.customer-review')
    <!-- End Customer Reviews -->

@endsection


