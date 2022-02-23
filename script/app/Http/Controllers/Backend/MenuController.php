<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Menu;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Str;
class MenuController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        Gate::authorize('admin.menus.index');
        $menus = Menu::latest('id')->get();
        return  view('admin.menus.index',compact('menus'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Gate::authorize('admin.menus.create');
        return view('admin.menus.form');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'name' => 'required|string|unique:menus',
            'description'=> 'nullable|string'
        ]);

        Menu::create([
            'name' => Str::slug($request->name),
            'description' => $request->description,
            'deletable' => true
        ]);
        notify()->success('Menu Successfully Added.', 'Added');
        return redirect()->route('admin.menus.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function show(Menu $menu)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function edit(Menu $menu)
    {
        Gate::authorize('admin.menus.edit');
        return view('admin.menus.form',compact('menu'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Menu $menu)
    {
        Gate::authorize('admin.menus.edit');
        $this->validate($request,[
            'name' => 'required|string|unique:menus,name,' . $menu->id,
            'description'=> 'nullable|string'
        ]);
        $menu->update([
            'name' => Str::slug($request->name),
            'description' => $request->description,
        ]);
        notify()->success('Menu Successfully Updated.', 'Updated');
        return redirect()->route('admin.menus.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function destroy(Menu $menu)
    {
        Gate::authorize('admin.menus.destroy');
        if ($menu->deletable == true)
        {
            $menu->delete();
            notify()->success('Menu Successfully Deleted.', 'Deleted');
        } else  {
            notify()->error('Sorry you can\'t delete system menu.', 'Error');
        }
        return redirect()->back();
    }
}
