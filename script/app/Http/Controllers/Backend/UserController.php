<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Gate;

class UserController extends Controller
{
   /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        Gate::authorize('admin.users.index');
        $data['users'] = User::all();
        return view('admin.users.index',$data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Gate::authorize('admin.users.create');
        $data['roles'] = Role::all();
        return view('admin.users.form',$data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        Gate::authorize('admin.users.create');
        $this->validate( $request,[
                'name'=> 'required|string|max:255',
                'email'=>'required|string|email|max:255|unique:users',
                'role'=>'required',
                'password'=>'required|string|confirmed|min:6'

            ]
        );


        $user = User::create([
            'role_id' => $request->role,
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'status' => $request->filled('status'),
        ]);

        //  // upload images
        //  if ($request->hasFile('avatar')) {
        //     $user->addMedia($request->avatar)->toMediaCollection('avatar');
        // }
        $user->save();
        notify()->success('User Successfully Added.', 'Added');
        return redirect()->route('admin.users.index');

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        Gate::authorize('admin.users.create');
        $data['roles'] = Role::all();
        return view('admin.users.show',compact('user'),$data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        Gate::authorize('admin.users.edit');
        // Gate::authrize('admin.roles.edit');
        $data['roles'] = Role::all();
        return view('admin.users.form',compact('user'),$data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        Gate::authorize('admin.users.edit');
        $this->validate( $request,[
                'name'=> 'required|string|max:255',
                'email'=>'required|string|email|max:255',
                'role'=>'required',
                'password'=>'nullable|string|confirmed|min:6',
                'avatar'=>'nullable|image'
            ]
        );

        $user->update([
            'role_id' => $request->role,
            'name' => $request->name,
            'email' => $request->email,
            'password' =>  isset($request->password) ? Hash::make($request->password) : $user->password,
            'status' => $request->filled('status'),
        ]);

        // upload images
        // if ($request->hasFile('avatar')) {
        //     $user->addMedia($request->avatar)->toMediaCollection('avatar');
        // }
        notify()->success('User Successfully Updated.', 'Updated');
        return redirect()->route('admin.users.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        Gate::authorize('admin.users.destroy');
        $user->delete();
        notify()->error('User Deleted','Success');
        return redirect()->back();
    }
}
