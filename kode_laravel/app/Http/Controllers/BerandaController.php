<?php

namespace App\Http\Controllers;
use App\Models\User;
use Illuminate\Http\Request;

class BerandaController extends Controller
{
    public function index()
    {
        $user = User::find(1); // Ganti dengan cara mendapatkan user yang benar
        return view('welcome', compact('user'));
    }
}
