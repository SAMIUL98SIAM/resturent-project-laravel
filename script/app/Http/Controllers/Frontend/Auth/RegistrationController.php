<?php

namespace App\Http\Controllers\Frontend\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Mail;
use App\Models\Logo;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class RegistrationController extends Controller
{
    public function index()
    {
        $data['logo'] = Logo::first();
        return view('frontend.auth.register',$data);
    }

    public function store(Request $request)
    {
       DB::transaction(function() use($request){
            $this->validate($request,[
                'name'=>'required',
                'email'=> 'required',
                //'email'=> 'required|unique:users,email',
                // 'mobile'=>['required','unique:users,mobile','regex:/(^(\+8801|8801|01|008801))[1|5-9]{1}(\d){8}$/'],
                'password'=>'required|min:6'
            ]);
            $code = rand(0000,9999);
            $user = new User();
            $user->name = $request->name;
            $user->email = $request->email;
            $user->role_id = 0;
            $user->password = bcrypt($request->password);
            $user->code = $code ;
            $user->status = false;
            $user->usertype = 'customer' ;
            $user->save();

            $data = array(
                'email'=>$request->email,
                'code'=>$code
            );
            Mail::send('frontend.auth.email-verify-text',$data,function($messages) use($data){
                $messages->from('orbitechproject123@gmail.com','Orbitech Bd');
                $messages->to($data['email']);
                $messages->from($data['email'],'Orbitech Bd');
                $messages->subject('Please your email address');
            });
       });
       notify()->success('You have successfully signed up, please verify your email.', 'success');
       return redirect()->route('customer.email_verify');

    }
}
