@extends('layouts.frontend.app')

@section('content')

    <!-- Start All Pages -->
    <div class="all-page-title page-breadcrumb">
        <div class="container text-center">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Customer Login</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Pages -->

    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                <div class="inner-column">
                    <h2>Login</h2>
                <form action="{{ route('login') }}" method="post">
                    @csrf
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <input type="email" name="email" id="email" class="form-control" placeholder="Email">
                        </div>
                        <font style="color: red">{{($errors->has('email'))?($errors->first('email')):''}}</font>
                    </div>
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <input type="password" name="password" id="password" placeholder="Enter your Password" class="form-control">
                        </div>
                        <font style="color: red">{{($errors->has('password'))?($errors->first('password')):''}}</font>
                    </div>
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <input type="submit" value="Login" class="btn btn-success">
                            <i class="fa fa-user"></i> No Account yet ? <a style="color: black;text-decoration:none;" href="{{route('customer.signup')}}"><span>SignUp new account</span></a>
                        </div>
                    </div>
                </form>
                </div>
            </div>
        </div>
    </div>

@endsection


