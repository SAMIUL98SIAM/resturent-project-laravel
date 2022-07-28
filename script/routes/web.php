<?php

use App\Events\Message;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Frontend\ChatController;
use Illuminate\Support\Facades\Request;

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

Route::get('/', [App\Http\Controllers\Frontend\DashboardController::class, 'index'])->name('index');
Route::get('/menu', [App\Http\Controllers\Frontend\MenuController::class, 'menu'])->name('menu');
Route::get('/about', [App\Http\Controllers\Frontend\AboutController::class, 'about'])->name('about');

Route::get('/reservation', [App\Http\Controllers\Frontend\Pages\ReservationController::class, 'reservation'])->name('reservation');
Route::get('/stuff', [App\Http\Controllers\Frontend\Pages\StuffController::class, 'stuff'])->name('stuff');
Route::get('/gallery', [App\Http\Controllers\Frontend\Pages\GalleryController::class, 'gallery'])->name('gallery');


// Route::get('/blog-detail', [App\Http\Controllers\Frontend\Blog\BlogDetailController::class, 'blog_detail'])->name('blog-detail');

Route::get('/contact', [App\Http\Controllers\Frontend\ContactController::class, 'contact'])->name('contact');

Route::get('/blog', [App\Http\Controllers\Frontend\Blog\BlogController::class, 'blog'])->name('blog');
Route::get('/blog/details/{slug}', [App\Http\Controllers\Frontend\Blog\BlogDetailController::class,'blog_details'])->name('blog.details');
Route::get('/blog/categories/{slug}', [App\Http\Controllers\Frontend\Blog\BlogDetailController::class,'blog_categories'])->name('blog.categories');
Route::get('/blog/tags/{slug}', [App\Http\Controllers\Frontend\Blog\BlogDetailController::class,'blog_tags'])->name('blog.tags');

Route::post('/comment/{post}', [App\Http\Controllers\Frontend\Blog\CommentController::class,'store'])->name('comment.store')->middleware(['auth','verified']);
Route::post('/comment-reply/{comment}', [App\Http\Controllers\Frontend\Blog\CommentReplyController::class,'store'])->name('reply.store')->middleware(['auth','verified']);
Route::post('/like-post/{post}', [ App\Http\Controllers\Frontend\Blog\LikeController::class,'likePost'])->name('post.like')->middleware(['auth','verified']);



Route::get('/customer-login', [App\Http\Controllers\Frontend\Auth\LoginController::class, 'index'])->name('customer.login');

Route::get('/customer-signup', [App\Http\Controllers\Frontend\Auth\RegistrationController::class, 'index'])->name('customer.signup');
Route::post('/customer-signup-store', [App\Http\Controllers\Frontend\Auth\RegistrationController::class, 'store'])->name('customer.signup.store');


Route::get('/email-verify', [App\Http\Controllers\Frontend\Auth\LoginController::class, 'emailVerify'])->name('customer.email_verify');
Route::post('/email-verify-store', [App\Http\Controllers\Frontend\Auth\LoginController::class, 'emailVerifyStore'])->name('customer.email_verify_store');




Route::get('/chat', [ChatController::class, 'index'])->name('chat');

Route::post('/send-message',function (Request $request){
    event(new Message($request->input('name'),$request->input('message')));
    return ["success"=> true];
});


Route::group(['as' => 'login.', 'prefix' => 'login'], function () {
    Route::get('/github', [LoginController::class, 'redirectToGithub'])->name('github');
    Route::get('/github/callback', [LoginController::class, 'handleGithubCallback'])->name('callback');

    Route::get('/google', [LoginController::class, 'redirectToGoogle'])->name('google');
    Route::get('/google/callback', [LoginController::class, 'handleGoogleCallback'])->name('callback');

    Route::get('/facebook', [LoginController::class, 'redirectToFacebook'])->name('facebook');
    Route::get('/facebook/callback', [LoginController::class, 'handleFacebookCallback'])->name('callback');


});


Auth::routes();









