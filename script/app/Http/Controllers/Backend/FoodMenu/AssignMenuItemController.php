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
        Gate::authorize('admin.food.assign-menu-items.index');
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
        Gate::authorize('admin.food.assign-menu-items.create');
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
        Gate::authorize('admin.food.assign-menu-items.create');
        $this->validate($request,[
            'special_menu_id'=> 'required'
        ]);
        $countItem = count($request->special_item_id);
        if($countItem!=NULL)
        {
            for($i=0;$i<$countItem;$i++)
            {
                $assignMenuItem = new AssignMenuItem();
                $assignMenuItem->special_menu_id = $request->special_menu_id ;
                $assignMenuItem->special_item_id = $request->special_item_id[$i] ;
                $assignMenuItem->description = $request->description[$i] ;
                $assignMenuItem->price = $request->price[$i] ;
                $assignMenuItem->save();
            }
        }

        notify()->success('Special Menu Item Successfully Added.', 'Added');
        return redirect()->route('admin.food.assign-menu-items.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Food\AssignMenuItem  $assignMenuItem
     * @return \Illuminate\Http\Response
     */
    public function show($special_menu_id)
    {
        Gate::authorize('admin.food.assign-menu-items.show');
        $data['assignMenuItem'] = AssignMenuItem::where('special_menu_id',$special_menu_id)->orderBy('special_item_id','asc')->get();
        return view('admin.food.assign-menu-items.show',$data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Food\AssignMenuItem  $assignMenuItem
     * @return \Illuminate\Http\Response
     */
    public function edit($special_menu_id)
    {
        Gate::authorize('admin.food.assign-menu-items.edit');
        $data['editAssignMenuItem'] = AssignMenuItem::where('special_menu_id',$special_menu_id)->orderBy('special_item_id','asc')->get();
        $data['specialMenus'] = SpecialMenu::all();
        $data['specialItems'] = SpecialItem::all();
        return view('admin.food.assign-menu-items.edit',$data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Food\AssignMenuItem  $assignMenuItem
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $special_menu_id)
    {
        if($request->special_item_id==NULL)
        {
            notify()->error('Sorry ! You dont have any item', 'error');
            return redirect()->back();
        }
        else
        {
            AssignMenuItem::where('special_menu_id',$special_menu_id)->delete();
            $countItem = count($request->special_item_id);
            for($i=0;$i<$countItem;$i++)
            {
                $assignMenuItem = new AssignMenuItem();
                $assignMenuItem->special_menu_id = $request->special_menu_id ;
                $assignMenuItem->special_item_id = $request->special_item_id[$i] ;
                $assignMenuItem->description = $request->description[$i] ;
                $assignMenuItem->price = $request->price[$i] ;
                $assignMenuItem->save();
            }
        }
        notify()->success('Special Menu Item Successfully Updated.', 'Updated');
        return redirect()->route('admin.food.assign-menu-items.index');
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
