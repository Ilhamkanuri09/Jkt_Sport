<?php

namespace App\Http\Controllers;
use App\Models\Produk;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProdukController extends Controller
{
    public function index()
    {
        $produks = produk::latest()->paginate(20);
        return view('Produk.index',compact('produks'))-> with('i',(request()->input('page',1)-1)*20);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('Produk.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'kode_produk' => 'required',
            'nama_produk' => 'required',
            'harga' => 'required',
            'stok' => 'required',
            'gambar' => 'required',
        ]);

        $file = $request->file('gambar');

        $nama_file = time()."_".$file->getClientOriginalName();

        $tujuan_upload = 'data_file';
        $file->move($tujuan_upload,$nama_file);

        Produk::create([
            'kode_produk' => $request->kode_produk,
            'nama_produk' => $request->nama_produk,
            'harga' => $request->harga,
            'stok' => $request->stok,
            'gambar' => $nama_file,
        ]);
        return redirect()->route('Produk.index')
                         ->with('success', 'Data Produk Berhasil Disimpan.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $produk = Produk::find($id);
        if (!$produk) {
            return redirect()->route('Produk.index')->with('error', 'Data Produk tidak ditemukan.');
        }

        return view('Produk.edit', compact('produk'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'kode_produk' => 'required',
            'nama_produk' => 'required',
            'harga' => 'required',
            'stok' => 'required',
        ]);
    
        $produk = Produk::find($id);
    
        if (!$produk) {
            return redirect()->route('produk.index')
                             ->with('error', 'Data produk Tidak Ditemukan.');
        }
    
        $produk->kode_produk = $request->kode_produk;
        $produk->nama_produk = $request->nama_produk;
        $produk->harga = $request->harga;
        $produk->stok = $request->stok;
    
        if ($request->hasFile('gambar')) {
            $file = $request->file('gambar');
            $nama_file = time()."_".$file->getClientOriginalName();
            $tujuan_upload = 'data_file';
            $file->move($tujuan_upload, $nama_file);
            $produk->gambar = $nama_file;
        }
    
        $produk->save();
    
        return redirect()->route('Produk.index')
                         ->with('success', 'Data Produk Berhasil Diperbarui.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $produk = Produk::find($id);
        if (!$produk) {
            return redirect()->route('Produk.index')->with('error', 'Data Produk tidak ditemukan.');
        }

        $produk->delete();

        return redirect()->route('Produk.index')->with('success', 'Data Produk Berhasil Dihapus.');
    }
}
