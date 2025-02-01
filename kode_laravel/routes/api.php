<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ProdukController;
use App\Http\Controllers\BerandaController;

// Public Routes
Route::post('/login', [UserController::class, 'authenticate']);
Route::post('/register', [UserController::class, 'store']); // User Registration

// Protected Routes (Require Authentication)
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [UserController::class, 'logout']);
    
    // Produk Routes
    Route::apiResource('/produk', ProdukController::class);
    
    // Beranda (Jika perlu)
    Route::get('/welcome', [BerandaController::class, 'index']);

    // User Routes
    Route::get('/users', [UserController::class, 'index']); // List users
    Route::get('/users/{id}', [UserController::class, 'show']); // Get user detail
});
