<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

     <!-- Site Metas -->
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <!-- Styles -->
    <link href="{{ asset('frontend/css/app.css') }}" rel="stylesheet">
    @include('layouts.frontend.partials.css')
    @stack('css')
</head>
<body>
    <div id="app">
         <!-- Start header -->
         @include('layouts.frontend.partials.header')
         <!-- End header -->
        <main class="py-4">


            @yield('content')

            <!-- Start Contact info -->
            @include('layouts.frontend.partials.contact')
            <!-- End Contact info -->
        </main>
        <!-- Start Footer -->
        @include('layouts.frontend.partials.footer')
        <!-- End Footer -->

        <a href="#" id="back-to-top" title="Back to top" style="display: none;"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></a>
    </div>


</body>
    <!-- Scripts -->
    <script src="{{ asset('frontend/js/app.js') }}"></script>
    @include('layouts.frontend.partials.js')
    @stack('js')
</html>
