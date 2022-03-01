<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Gallery;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Request;

class GalleryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        Gate::authorize('admin.galleries.index');

        $data['galleries'] = Gallery::all();
        return view('admin.galleries.index',$data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Gate::authorize('admin.galleries.create');
        return view('admin.galleries.form');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        Gate::authorize('admin.galleries.create');
        $this->validate( $request,[
            'image'=>'required|image'
        ]
        );
        $gallery = new Gallery() ;
        if($request->file('image')){
            $file = $request->file('image');
            //@unlink(('uploads/user_images'.$user->image));
            $filename = date('YmdHi').$file->getClientOriginalName();
            $file->move(('uploads/gallery_images'),$filename);
            $gallery['image'] = $filename;
        }
        $gallery->save();
        notify()->success('Gallery Image Successfully Added.', 'Added');
        return redirect()->route('admin.galleries.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Gallery  $gallery
     * @return \Illuminate\Http\Response
     */
    public function show(Gallery $gallery)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Gallery  $gallery
     * @return \Illuminate\Http\Response
     */
    public function edit(Gallery $gallery)
    {
        Gate::authorize('admin.galleries.edit');
        return view('admin.galleries.form',compact('gallery'),);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Gallery  $gallery
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Gallery $gallery)
    {
        Gate::authorize('admin.galleries.edit');
        $this->validate( $request,[
            'image'=>'nullable|image'
        ]
        );
        if($request->file('image')){
            $file = $request->file('image');
            @unlink(('uploads/gallery_images'.$gallery->image));
            $filename = date('YmdHi').$file->getClientOriginalName();
            $file->move(('uploads/gallery_images'),$filename);
            $gallery['image'] = $filename;
        }
        $gallery->save();
        notify()->success('Gallery Image Successfully Updated.', 'Updated');
        return redirect()->route('admin.galleries.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Gallery  $gallery
     * @return \Illuminate\Http\Response
     */
    public function destroy(Gallery $gallery)
    {
        Gate::authorize('admin.galleries.destroy');
        $gallery->delete();
        notify()->error('Gallery Deleted','Success');
        return redirect()->back();
    }
}
