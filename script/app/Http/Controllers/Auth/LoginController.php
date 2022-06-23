<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Role;
use Laravel\Socialite\Facades\Socialite;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    public function login(Request $request)
    {
        $this->validate($request,[
            'email'=>'required',
            'password'=>'required'
        ]);

        $email = $request->email;
        $password = $request->password ;
        $validData = User::where('email',$email)->first();
        $password_check = password_verify($password,@$validData->password);
        if ($password_check == false) {
            notify()->error('Email or Password does not match','Error');
            return redirect()->back();
        }
        elseif($validData->status==0)
        {
             notify()->error('Sorry! your are not verified yet','Error');
             return redirect()->back();
        }
        if(Auth::attempt(['email'=>$email,'password'=>$password])) {
            return redirect()->route('customer.dashboard');
        }
    }


    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }


    protected function authenticated(Request $request, $user)
    {
        $user->update([
            'last_login_at' => now()
        ]);
        // Show greetings.
        notify()->success("Hey $user->name, Welcome Back!",'Success');
    }

}
