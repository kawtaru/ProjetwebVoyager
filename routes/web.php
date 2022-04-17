<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    Route::get('/admin/pages',[App\Http\Controllers\TestController::class, 'index'])->name('test');
});

Auth::routes(['verify'=> true]);

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/deny/{id}',[App\Http\Controllers\DossierController::class, 'deny'])->name('deny');
Route::get('/accept/{id}',[App\Http\Controllers\DossierController::class, 'accept'])->name('accept');