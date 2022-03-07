<?php

namespace App\Http\Controllers\Backend\FoodMenu;

use App\Http\Controllers\Controller;
use App\Models\Food\SpecialMenu;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class SpecialMenuController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        Gate::authorize('admin.food.special-menus.index');
        $data['specialMenus'] = SpecialMenu::all();
        return view('admin.food.special-menus.index',$data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Gate::authorize('admin.food.special-menus.create');
        return view('admin.food.special-menus.form');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        Gate::authorize('admin.food.special-menus.create');
        $this->validate($request,[
            'name'=> 'required|unique:special_menus'
        ]);
        SpecialMenu::create([
            'name'=> $request->name ,
            'slug'=> Str::slug($request->name),
        ]);
        notify()->success('Special Menu Successfully Added.', 'Added');
        return redirect()->route('admin.food.special-menus.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\FoodMenu\SpecialMenu  $specialMenu
     * @return \Illuminate\Http\Response
     */
    public function show(SpecialMenu $specialMenu)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\FoodMenu\SpecialMenu  $specialMenu
     * @return \Illuminate\Http\Response
     */
    public function edit(SpecialMenu $specialMenu)
    {
        Gate::authorize('admin.food.special-menus.edit');
        return view('admin.food.special-menus.form',compact('specialMenu'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\FoodMenu\SpecialMenu  $specialMenu
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, SpecialMenu $specialMenu)
    {
        Gate::authorize('admin.food.special-menus.edit');
        $this->validate($request,[
            'name'=> 'required|unique:roles'
        ]);
        $specialMenu->update([
            'name'=> $request->name ,
            'slug'=> Str::slug($request->name),
        ]);
        notify()->success('Special Menu Successfully Updated.', 'Updated');
        return redirect()->route('admin.food.special-menus.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\FoodMenu\SpecialMenu  $specialMenu
     * @return \Illuminate\Http\Response
     */
    public function destroy(SpecialMenu $specialMenu)
    {
        Gate::authorize('admin.food.special-menus.destroy');
        $specialMenu->delete();
        notify()->error('Sepecial Menu Deleted','Success');
        return redirect()->back();
    }

}
