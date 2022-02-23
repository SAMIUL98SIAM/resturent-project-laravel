@extends('layouts.backend.app')

@section('content')
<div class="app-page-title">
    <div class="page-title-wrapper">
        <div class="page-title-heading">
            <div class="page-title-icon">
                <i class="pe-7s-settings icon-gradient bg-mean-fruit">
                </i>
            </div>
            <div>Socialite Settings</div>
        </div>
        <div class="page-title-actions">
            <a href="{{url('admin/dashboard')}}" type="button" class="btn-shadow mr-3 btn btn-primary"><i class="fas fa-backspace"></i> Back</a>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-3">
        @include('admin.settings.sidebar')
    </div>

    <div class="col-md-9">
        {{-- how to use callout --}}
        <div class="main-card mb-3 card">
            <div class="card-body">
                <h5 class="card-title">How To Use:</h5>
                <p>You can get the value of each setting anywhere on your site by calling <code>setting('key')</code></p>
            </div>
        </div>
        <!-- form start -->
        <form autocomplete="off" role="form" method="POST" action="{{ route('admin.settings.socialite.update') }}">
            @csrf
            @method('PUT')
            <!-- general form elements -->
            <div class="main-card mb-3 card">
                <div class="card-body">
                    <div class="form-row">
                        <div class="col">
                            <div class="form-group">
                                <label for="facebook_client_id">Facebook Client Id</label>
                                <input type="text" name="facebook_client_id" id="facebook_client_id"
                                       class="form-control @error('mail_mailer') is-invalid @enderror"
                                       value="{{ setting('facebook_client_id') ?? old('facebook_client_id') }}"
                                       placeholder="Client Id">
                                @error('facebook_client_id')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="facebook_client_secret">Facebook Client Secret</label>
                                <input type="text" name="facebook_client_secret" id="facebook_client_secret"
                                       class="form-control @error('facebook_client_secret') is-invalid @enderror"
                                       value="{{ setting('facebook_client_secret') ?? old('facebook_client_secret') }}"
                                       placeholder="Secret">
                                @error('facebook_client_secret')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="col">
                            <div class="form-group">
                                <label for="google_client_id">Google Client Id</label>
                                <input type="text" name="google_client_id" id="google_client_id"
                                       class="form-control @error('mail_mailer') is-invalid @enderror"
                                       value="{{ setting('google_client_id') ?? old('google_client_id') }}"
                                       placeholder="Client Id">
                                @error('google_client_id')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="google_client_secret">Google Client Secret</label>
                                <input type="text" name="google_client_secret" id="google_client_secret"
                                       class="form-control @error('google_client_secret') is-invalid @enderror"
                                       value="{{ setting('google_client_secret') ?? old('google_client_secret') }}"
                                       placeholder="Secret">
                                @error('google_client_secret')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-arrow-circle-up"></i>
                        <span>Update</span>
                    </button>

                </div>
            </div>
            <!-- /.card -->
        </form>
    </div>
</div>
@endsection


