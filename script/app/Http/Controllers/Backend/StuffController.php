<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Stuff;
use App\Models\StuffPosition;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Request;

class StuffController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        Gate::authorize('admin.stuffs.index');
        $data['stuffs'] = Stuff::all();
        return view('admin.stuffs.index',$data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Gate::authorize('admin.stuffs.create');
        $data['stuff_positions'] = StuffPosition::all();
        return view('admin.stuffs.form',$data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        Gate::authorize('admin.stuffs.create');
        $this->validate( $request,[
            'name'=> 'required|string|max:255',
            'facebook_link'=>'required',
            'google_link'=>'required',
            'instagram_link'=>'required',
            'linkedin_link'=>'required',
            'image'=>'required|image'
            ]
       );
        if($request->stuff_position_id == 0)
        {
            $stuff_position = new StuffPosition();
            $stuff_position->sp_name = $request->sp_name ;
            $stuff_position->save();
            $stuff_position_id = $stuff_position->id ;
        }
        else
        {
            $stuff_position_id = $request->stuff_position_id ;
        }

        $stuff = Stuff::create([
            'name' => $request->name,
            'facebook_link' => $request->facebook_link,
            'google_link' => $request->google_link,
            'instagram_link' => $request->instagram_link,
            'linkedin_link' => $request->linkedin_link,
            'stuff_position_id' => $stuff_position_id,
        ]);


        if($request->file('image')){
            $file = $request->file('image');
            $filename = date('YmdHi').$file->getClientOriginalName();
            $file->move(('uploads/stuff_images'),$filename);
            $stuff['image'] = $filename;
        }
        $stuff->save();
        notify()->success('Stuff Successfully Added.', 'Added');
        return redirect()->route('admin.stuffs.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Stuff  $stuff
     * @return \Illuminate\Http\Response
     */
    public function show(Stuff $stuff)
    {
        // Gate::authorize('admin.stuffs.create');
        // $data['stuff_positions'] = StuffPosition::all();
        // return view('admin.stuffs.show',compact('stuff'),$data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Stuff  $stuff
     * @return \Illuminate\Http\Response
     */
    public function edit(Stuff $stuff)
    {
        Gate::authorize('admin.stuffs.edit');
        $data['stuff_positions'] = StuffPosition::all();
        return view('admin.stuffs.form',compact('stuff'),$data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Stuff  $stuff
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Stuff $stuff)
    {
        Gate::authorize('admin.stuffs.edit');
        $this->validate( $request,[
            'name'=> 'required|string|max:255',
            'facebook_link'=>'required',
            'google_link'=>'required',
            'instagram_link'=>'required',
            'linkedin_link'=>'required'
            ]
        );

        if($request->stuff_position_id == 0)
        {
            $stuff_position = new StuffPosition();
            $stuff_position->sp_name = $request->sp_name ;
            $stuff_position->save();
            $stuff_position_id = $stuff_position->id ;
        }
        else
        {
            $stuff_position_id = $request->stuff_position_id ;
        }

        $stuff->update([
            'name' => $request->name,
            'facebook_link' => $request->facebook_link,
            'google_link' => $request->google_link,
            'instagram_link' => $request->instagram_link,
            'linkedin_link' => $request->linkedin_link,
            'stuff_position_id' => $stuff_position_id,
        ]);

        if($request->file('image')){
            $file = $request->file('image');
            @unlink(('uploads/stuff_images'.$stuff->image));
            $filename = date('YmdHi').$file->getClientOriginalName();
            $file->move(('uploads/stuff_images'),$filename);
            $stuff['image'] = $filename;
        }
        $stuff->save();
        notify()->success('Stuff Successfully Updated.', 'Updated');
        return redirect()->route('admin.stuffs.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Stuff  $stuff
     * @return \Illuminate\Http\Response
     */
    public function destroy(Stuff $stuff)
    {
        Gate::authorize('admin.stuffs.destroy');
        $stuff->delete();
        notify()->error('Stuff Deleted','Success');
        return redirect()->back();
    }
}
