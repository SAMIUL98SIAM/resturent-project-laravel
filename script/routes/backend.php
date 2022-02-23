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
use App\Http\Controllers\Backend\SettingController;

use App\Http\Controllers\Backend\Menu\BackendSidebarMenuBuilderController;

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

//Menu
Route::resource('menus',MenuController::class)->except(['show']);

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

