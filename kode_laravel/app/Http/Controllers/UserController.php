<?php

namespace App\Http\Controllers;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index()
    {
        return view('login',['title' => 'login']);
    }

    public function authenticate(Request $request){
        $credential = $request->validate([
            'email' => ['required', 'email:dns'],
            'password' => ['required']
        ]);
        if(Auth::attempt($credential)){
            $request->session()->regenerate();
            return redirect()->intended('welcome');
        }
        return back()->with('loginError','login Failed');
    }

    public function logout(Request $request){
        Auth::logout();
        request()->session()->invalidate();
        return redirect('/login');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('users.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
        ]);
    
        $user = User::create([
            'name' => $validatedData['name'],
            'email' => $validatedData['email'],
            'password' => Hash::make($validatedData['password']),
        ]);
    
        return redirect()->route('login')->with('success', 'Pengguna berhasil dibuat!');
    }
}
