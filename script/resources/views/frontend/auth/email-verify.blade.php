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
            <div class="col-lg-6 col-md-6 col-sm-12 text-center">
                <div class="inner-column">
                    <h2>Email Verify</h2>
                    <form action="{{route('customer.email_verify_store')}}" method="post">
                        @csrf
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <input type="email" name="email" id="email" class="form-control" placeholder="Email">
                            </div>
                            <font style="color: red">{{($errors->has('email'))?($errors->first('email')):''}}</font>
                        </div>
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <input type="code" name="code" id="code" placeholder="Verify Code" class="form-control">
                            </div>
                            <font style="color: red">{{($errors->has('code'))?($errors->first('code')):''}}</font>
                        </div>
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <input type="submit" value="Verify" class="btn btn-block btn-success">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection


