@extends('layouts.frontend.app')

@section('content')

    <!-- Start slides -->
    @include('layouts.frontend.partials.slider')
    <!-- End slides -->

    <!-- Start About -->
    @include('layouts.frontend.partials.about')
    <!-- End About -->

    <!-- Start QT -->
    @include('layouts.frontend.partials.quote')
    <!-- End QT -->

    <!-- Start Menu -->
    @include('layouts.frontend.partials.menu')
    <!-- End Menu -->

    <!-- Start Gallery -->
    @include('layouts.frontend.partials.gallary')
    <!-- End Gallery -->

    <!-- Start Customer Reviews -->
    @include('layouts.frontend.partials.customer-review')
    <!-- End Customer Reviews -->

@endsection


