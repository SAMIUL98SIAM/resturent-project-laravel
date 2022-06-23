@extends('layouts.frontend.app')

@section('content')

    <!-- Start All Pages -->
    <div class="all-page-title page-breadcrumb">
        <div class="container text-center">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Customer Registration</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Pages -->

    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                <div class="inner-column">
                    <h1>Welcome To <span>Live Dinner Restaurant</span></h1>
                    <h2 >Sign up</h2>
                    <form action="{{route('customer.signup.store')}}"  method="post">
                        @csrf
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <input type="name" name="name" id="name" class="form-control" placeholder="Username">
                            </div>
                            <font style="color: red">{{($errors->has('name'))?($errors->first('name')):''}}</font>
                        </div>
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
                                <input type="submit" value="Signup" class="btn btn-success">
                                <i class="fa fa-user"></i> Have you account ? <a style="color: black;text-decoration:none;" href="{{route('customer.login')}}"><span>Login here</span></a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection


