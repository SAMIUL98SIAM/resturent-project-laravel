<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Slider;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class SliderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        Gate::authorize('admin.sliders.index');
        $sliders= Slider::all();
        return view('admin.sliders.index',compact('sliders'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Gate::authorize('admin.sliders.create');
        return view('admin.sliders.form');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        Gate::authorize('admin.sliders.create');
        $this->validate( $request,[
                'short_title' => 'required',
                'long_title' => 'required',
                'long_title_o' => 'required',
                'image'=>'required|image'
            ]
        );
        $slider = Slider::create([
            'short_title' => $request->short_title,
            'long_title' => $request->long_title,
            'long_title_o' => $request->long_title_o,
        ]);
        if($request->file('image')){
            $file = $request->file('image');
            $filename = date('YmdHi').$file->getClientOriginalName();
            $file->move(('uploads/slider_images'),$filename);
            $slider['image'] = $filename;
        }
        $slider->save();
        notify()->success('Slider Successfully Added.', 'Added');
        return redirect()->route('admin.sliders.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function show(Slider $slider)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function edit(Slider $slider)
    {
        Gate::authorize('admin.sliders.edit');
        return view('admin.sliders.form',compact('slider'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Slider $slider)
    {
        Gate::authorize('admin.sliders.edit');
        $this->validate( $request,[
            'short_title' => 'nullable|required',
            'long_title' => 'nullable|required',
            'long_title_o' => 'nullable|required',

            ]
        );
        $slider->update([
            'short_title' => $request->short_title,
            'long_title' => $request->long_title,
            'long_title_o' => $request->long_title_o,
        ]);
        if($request->file('image')){
            $file = $request->file('image');
            @unlink(('uploads/slider_images'.$slider->image));
            $filename = date('YmdHi').$file->getClientOriginalName();
            $file->move(('uploads/slider_images'),$filename);
            $slider['image'] = $filename;
        }
        $slider->save();
        notify()->success('Slider Successfully Updated.', 'Updated');
        return redirect()->route('admin.sliders.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function destroy(Slider $slider)
    {
        Gate::authorize('admin.sliders.destroy');
        $slider->delete();
        notify()->error('Slider Deleted','Success');
        return redirect()->back();
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function activate($id)
    {
        Gate::authorize('admin.sliders.activate');
        $slider = Slider::find($id);
        $slider->status = 1;
        $slider->update();
        notify()->success('Slider Successfully Activated.', 'Activated');
        return redirect()->back();
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function unactivate($id)
    {
        Gate::authorize('admin.sliders.unactivate');
        $slider = Slider::find($id);
        $slider->status = 0;
        $slider->update();
        notify()->success('Slider Successfully Unactivated.', 'Unactivated');
        return redirect()->back();
    }




}
