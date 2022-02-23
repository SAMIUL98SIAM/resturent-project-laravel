@extends('layouts.frontend.app')

@section('content')

    <!-- Start All Pages -->
	<div class="all-page-title page-breadcrumb">
		<div class="container text-center">
			<div class="row">
				<div class="col-lg-12">
					<h1>Special Menu</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Pages -->

    <!-- Start Menu -->
    @include('layouts.frontend.partials.menu')
    <!-- End Menu -->

    <!-- Start QT -->
    @include('layouts.frontend.partials.quote')
    <!-- End QT -->

    <!-- Start Customer Reviews -->
    @include('layouts.frontend.partials.customer-review')
    <!-- End Customer Reviews -->

@endsection


