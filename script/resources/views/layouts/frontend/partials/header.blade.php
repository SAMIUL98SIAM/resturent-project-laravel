<header class="top-navbar">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="{{route('index')}}">
                {{-- <img src="{{asset('frontend/images/logo.png')}}" alt="" /> --}}
                <img src="{{!empty($logo->image)?url('uploads/logo_images/'.$logo->image):url('/uploads/no_image.jpg/')}}" style="width: 100px;height: 93px;" alt="Logo Image" />
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbars-rs-food">
                <ul class="navbar-nav ml-auto">
                   <x-frontend-header />
                   @if (@Auth::user()->id != Null && @Auth::user()->usertype=='customer')
                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">Account</a>
                        <ul class="dropdown-menu" aria-labelledby="dropdown-a">
                            <a class="dropdown-item" href="{{route('customer.dashboard')}}">Customer Dashboard</a>
                            <a type="button" class="dropdown-item" onclick="event.preventDefault();document.getElementById('logout-form').submit();">Logout</a>
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                @csrf
                            </form>
                        </ul>
                    </li>
                    @elseif(@Auth::user()->id != Null && @Auth::user()->usertype=='admin')
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">You logged as an Admin, Go to your Dashbard</a>
                    @else
                    <li class="nav-item"><a class="nav-link" href="{{route('customer.login')}}">Login</a></li>
                    @endif
                </ul>
            </div>
        </div>
    </nav>
</header>
