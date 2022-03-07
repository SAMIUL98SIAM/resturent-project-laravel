<?php

namespace App\Http\Controllers\Backend\FoodMenu;

use App\Http\Controllers\Controller;
use App\Models\Food\SpecialItem;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class SpecialItemController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        Gate::authorize('admin.food.special-items.index');
        $data['specialItems'] = SpecialItem::all();
        return view('admin.food.special-items.index',$data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Gate::authorize('admin.food.special-items.create');
        return view('admin.food.special-items.form');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        Gate::authorize('admin.food.special-items.create');
        $this->validate($request,[
            'name'=> 'required|unique:special_items'
        ]);
        SpecialItem::create([
            'name'=> $request->name ,
            'slug'=> Str::slug($request->name),
            // 'description'=> $request->description,
            // 'price'=> $request->price ,
        ]);


        // if($request->file('image')){
        //     $file = $request->file('image');
        //     //@unlink(('uploads/user_images'.$user->image));
        //     $filename = date('YmdHi').$file->getClientOriginalName();
        //     $file->move(('uploads/gallery_images'),$filename);
        //     $gallery['image'] = $filename;
        // }
        // $gallery->save();

        notify()->success('Special Item Successfully Added.', 'Added');
        return redirect()->route('admin.food.special-items.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\FoodMenu\SpecialItem  $specialItem
     * @return \Illuminate\Http\Response
     */
    public function show(SpecialItem $specialItem)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\FoodMenu\SpecialItem  $specialItem
     * @return \Illuminate\Http\Response
     */
    public function edit(SpecialItem $specialItem)
    {
        Gate::authorize('admin.food.special-items.edit');
        return view('admin.food.special-items.form',compact('specialItem'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\FoodMenu\SpecialItem  $specialItem
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, SpecialItem $specialItem)
    {
        Gate::authorize('admin.food.special-items.edit');
        $this->validate($request,[
            'name'=> 'required'
        ]);
        $specialItem->update([
            'name'=> $request->name ,
            'slug'=> Str::slug($request->name),
            // 'description'=> $request->description,
            // 'price'=> $request->price ,
        ]);
        notify()->success('Special Item Successfully Updated.', 'Updated');
        return redirect()->route('admin.food.special-items.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\FoodMenu\SpecialItem  $specialItem
     * @return \Illuminate\Http\Response
     */
    public function destroy(SpecialItem $specialItem)
    {
        Gate::authorize('admin.food.special-items.destroy');
        $specialItem->delete();
        notify()->error('Special Items Deleted','Success');
        return redirect()->back();
    }

}
