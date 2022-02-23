@extends('layouts.frontend.app')

@section('content')

    <!-- Start header -->
    <div class="all-page-title page-breadcrumb">
        <div class="container text-center">
            <div class="row">
                <div class="col-lg-12">
                    <h1>About Us</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- End header -->

    <!-- Start About -->
    @include('layouts.frontend.partials.about')
    <!-- End About -->

    <!-- Start Menu -->
    @include('layouts.frontend.partials.menu')
    <!-- End Menu -->

    <!-- Start Gallery -->
    @include('layouts.frontend.partials.gallary')
    <!-- End Gallery -->

@endsection


