<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\Logo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Log;

class LogoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        Gate::authorize('admin.logos.index');
        $data['countLogo'] = Logo::count();
        $data['logos'] = Logo::all();
        return view('admin.logos.index',$data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Gate::authorize('admin.logos.create');
        return view('admin.logos.form');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        Gate::authorize('admin.logos.create');
        $this->validate( $request,[
                'image'=>'required|image'
            ]
        );
        $logo = new Logo() ;
        if($request->file('image')){
            $file = $request->file('image');
            //@unlink(('uploads/user_images'.$user->image));
            $filename = date('YmdHi').$file->getClientOriginalName();
            $file->move(('uploads/logo_images'),$filename);
            $logo['image'] = $filename;
        }
        $logo->save();
        notify()->success('Logo Successfully Added.', 'Added');
        return redirect()->route('admin.logos.index');

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Logo  $logo
     * @return \Illuminate\Http\Response
     */
    public function show(Logo $logo)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Logo  $logo
     * @return \Illuminate\Http\Response
     */
    public function edit(Logo $logo)
    {
        Gate::authorize('admin.logos.edit');
        return view('admin.logos.form',compact('logo'),);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Logo  $logo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Logo $logo)
    {
        Gate::authorize('admin.logos.edit');

        $this->validate( $request,[
            'image'=>'nullable|image'
        ]
        );

        if($request->file('image')){
            $file = $request->file('image');
            @unlink(('uploads/logo_images'.$logo->image));
            $filename = date('YmdHi').$file->getClientOriginalName();
            $file->move(('uploads/logo_images'),$filename);
            $logo['image'] = $filename;
        }
        $logo->save();
        notify()->success('Logo Successfully Updated.', 'Added');
        return redirect()->route('admin.logos.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Logo  $logo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Logo $logo)
    {
        Gate::authorize('admin.logos.destroy');
        $logo->delete();
        notify()->error('Logo Deleted','Success');
        return redirect()->back();
    }
}
