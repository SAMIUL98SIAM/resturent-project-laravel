<?php

namespace App\Http\Controllers\Frontend\Auth;

use App\Http\Controllers\Controller;
use App\Models\Logo;
use App\Models\Gallery;
use App\Models\Slider;
use App\Models\User;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    public function index()
    {
        $data['logo'] = Logo::first();
        return view('frontend.auth.login',$data);
    }




    public function emailVerify()
    {
        $data['logo'] = Logo::first();

        return view('frontend.auth.email-verify',$data);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function emailVerifyStore(Request $request)
    {
        $this->validate($request,[
            'email'=> 'required',
            'code'=>'required'
        ]);
        $checkData = User::where('email',$request->email)->where('code',$request->code)->first();
        if($checkData)
        {
           $checkData->status = 1 ;
           $checkData->save();
           return redirect()->route('customer.login')->with('success','You have successfully verified, please, logged in');
        }
        else
        {
            return redirect()->back()->with('error','Sorry email or verification code does not match');
        }
    }




}
