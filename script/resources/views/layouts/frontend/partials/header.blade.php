<header class="top-navbar">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="{{route('dashboard')}}">
                <img src="{{asset('frontend/images/logo.png')}}" alt="" />
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbars-rs-food">
                <ul class="navbar-nav ml-auto">

                   <x-frontend-header />
                   {{-- <li class="nav-item active"><a class="nav-link" href="{{route('dashboard')}}">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="{{route('menu')}}">Menu</a></li>
                    <li class="nav-item"><a class="nav-link" href="{{route('about')}}">About</a></li>

                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">Pages</a>
                        <ul class="dropdown-menu" aria-labelledby="dropdown-a">
                            <a class="dropdown-item active" href="{{route('reservation')}}">Reservation</a>
                            <a class="dropdown-item" href="{{route('stuff')}}">Stuff</a>
                            <a class="dropdown-item" href="{{route('gallery')}}">Gallery</a>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">Blog</a>
                        <ul class="dropdown-menu" aria-labelledby="dropdown-a">
                            <a class="dropdown-item" href="{{route('blog')}}">blog</a>
                            <a class="dropdown-item" href="{{route('blog-detail')}}">blog Single</a>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="{{route('contact')}}">Contact</a></li> --}}


                </ul>
            </div>
        </div>
    </nav>
</header>
