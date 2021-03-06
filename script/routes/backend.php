<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Backend\DashboardController;
use App\Http\Controllers\Backend\UserController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\Backend\RoleController;
use App\Http\Controllers\Backend\ProfileController;
use App\Http\Controllers\Backend\MenuController;
use App\Http\Controllers\Backend\MenuBuilderController;
use App\Http\Controllers\Backend\BackupController;
use App\Http\Controllers\Backend\FoodMenu\AssignMenuItemController;
use App\Http\Controllers\Backend\GalleryController;
use App\Http\Controllers\Backend\SettingController;
use App\Http\Controllers\Backend\LogoController;
use App\Http\Controllers\Backend\SliderController;
use App\Http\Controllers\Backend\StuffController;
use App\Http\Controllers\Backend\FoodMenu\SpecialMenuController;
use App\Http\Controllers\Backend\FoodMenu\SpecialItemController;
use App\Http\Controllers\Backend\Blog\CategoryController;
use App\Http\Controllers\Backend\Blog\PostController;
use App\Http\Controllers\Backend\Blog\TagController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::get('/dashboard',DashboardController::class)->name('dashboard');

//Roles & Users
Route::resource('roles',RoleController::class);
Route::resource('users',UserController::class);


//Profile
Route::get('profile',[ProfileController::class,'index'])->name('profile.index');
Route::post('profile',[ProfileController::class,'update'])->name('profile.update');

//Security
Route::get('profile/security', [ProfileController::class, 'changePassword'])->name('profile.password.change');
Route::post('profile/security', [ProfileController::class, 'updatePassword'])->name('profile.password.update');


//Backups
Route::resource('backups',BackupController::class)->only(['index','store','destroy']);
Route::get('backups/{file_name}',[BackupController::class,'download'])->name('backups.download');
Route::delete('backups', [BackupController::class, 'clean'])->name('backups.clean');

//Logo
Route::resource('logos',LogoController::class)->except(['show']);

//Slider
Route::resource('sliders',SliderController::class)->except(['show']);
Route::get('sliders/activate/{id}',[SliderController::class,'activate'])->name('sliders.activate');
Route::get('sliders/unactivate/{id}',[SliderController::class,'unactivate'])->name('sliders.unactivate');


//Gallery
Route::resource('galleries',GalleryController::class)->except(['show']);

//Stuff
Route::resource('stuffs',StuffController::class);


//Menu
Route::resource('menus',MenuController::class)->except(['show']);


Route::group(['as'=>'blog.','prefix'=>'blog'],function(){
    Route::resource('categories',CategoryController::class);
    Route::resource('tags', TagController::class);
    Route::resource('posts', PostController::class);
});


Route::group(['as'=>'food.','prefix'=>'food'],function(){
    Route::resource('special-menus',SpecialMenuController::class)->except(['show']);
    Route::resource('special-items',SpecialItemController::class)->except(['show']);
    Route::resource('assign-menu-items',AssignMenuItemController::class)->only(['index','create','store','destroy']);
    Route::get('/assign-menu-items/show/{special_menu_id}', [AssignMenuItemController::class, 'show'])->name('assign-menu-items.show');
    Route::get('/assign-menu-items/edit/{special_menu_id}', [AssignMenuItemController::class, 'edit'])->name('assign-menu-items.edit');
    Route::post('/assign-menu-items/update/{special_menu_id}', [AssignMenuItemController::class, 'update'])->name('assign-menu-items.update');
});



//Menu Items
Route::group(['as'=>'menus.','prefix'=>'menus/{id}'],function(){
    Route::post('order',[MenuBuilderController::class,'order'])->name('order');
    Route::get('builder',[MenuBuilderController::class,'index'])->name('builder');

    Route::group(['as' => 'item.', 'prefix' => 'item'], function () {
        Route::get('/create', [MenuBuilderController::class, 'itemCreate'])->name('create');
        Route::post('/store', [MenuBuilderController::class, 'itemStore'])->name('store');
        Route::get('/{itemId}/edit', [MenuBuilderController::class, 'itemEdit'])->name('edit');
        Route::put('/{itemId}/update', [MenuBuilderController::class, 'itemUpdate'])->name('update');
        Route::delete('/{itemId}/destroy', [MenuBuilderController::class, 'itemDestroy'])->name('destroy');
    });
});

//Setting
Route::group(['as'=>'settings.','prefix'=>'settings'],function()
{
    Route::get('/general', [SettingController::class, 'general'])->name('general');
    Route::put('/general', [SettingController::class, 'generalUpdate'])->name('general.update');

    Route::get('/appearence', [SettingController::class, 'appearence'])->name('appearence');
    Route::put('/appearence', [SettingController::class, 'appearenceUpdate'])->name('appearence.update');

    Route::get('/mail', [SettingController::class, 'mail'])->name('mail');
    Route::put('/mail', [SettingController::class, 'mailUpdate'])->name('mail.update');

    Route::get('/socialite', [SettingController::class, 'socialite'])->name('socialite');
    Route::put('/socialite', [SettingController::class, 'socialiteUpdate'])->name('socialite.update');
});

