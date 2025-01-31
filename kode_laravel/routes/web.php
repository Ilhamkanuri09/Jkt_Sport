<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
Route::get('/', function(){
    return redirect()->to('/login');
});  
Route::get('/welcome', function () {
    return view('welcome');
});
Route::resource('Produk',App\Http\Controllers\ProdukController::class);
Route::get('/login',[App\Http\Controllers\UserController::class, 'index'])->name('login')->middleware('guest');
Route::post('/login',[App\Http\Controllers\UserController::class, 'authenticate']);
Route::get('/logout',[App\Http\Controllers\UserController::class, 'logout']);
Route::get('/users/create', [UserController::class, 'create']);
Route::post('/users', [UserController::class, 'store'])->name('users.store');
Route::get('/welcome', [App\Http\Controllers\BerandaController::class, 'index']);