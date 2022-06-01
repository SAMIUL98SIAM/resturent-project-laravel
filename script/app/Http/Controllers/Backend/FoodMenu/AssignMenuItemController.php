<?php

namespace App\Http\Controllers\Backend\FoodMenu;

use App\Http\Controllers\Controller;
use App\Models\Food\AssignMenuItem;
use App\Models\Food\SpecialMenu;
use App\Models\Food\SpecialItem;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Request;

class AssignMenuItemController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        Gate::authorize('admin.food.special-items.index');
        $data['assignMenuItems'] = AssignMenuItem::select('special_menu_id')->groupBy('special_menu_id')->get();
        return view('admin.food.assign-menu-items.index',$data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        Gate::authorize('admin.food.special-items.create');
        $data['specialMenus'] = SpecialMenu::all();
        $data['specialItems'] = SpecialItem::all();
        return view('admin.food.assign-menu-items.create',$data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Food\AssignMenuItem  $assignMenuItem
     * @return \Illuminate\Http\Response
     */
    public function show(AssignMenuItem $assignMenuItem)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Food\AssignMenuItem  $assignMenuItem
     * @return \Illuminate\Http\Response
     */
    public function edit(AssignMenuItem $assignMenuItem)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Food\AssignMenuItem  $assignMenuItem
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AssignMenuItem $assignMenuItem)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Food\AssignMenuItem  $assignMenuItem
     * @return \Illuminate\Http\Response
     */
    public function destroy(AssignMenuItem $assignMenuItem)
    {
        //
    }
}
