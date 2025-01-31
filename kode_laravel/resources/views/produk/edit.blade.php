@extends('layout')
@section('content')
<div class="col-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body"><br></br>
                    <h2 class="card-title">Update Data Produk</h2>
                    <form class="forms-sample" action="{{ route('Produk.update', $produk->id) }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                      <div class="form-group">
                        <label for="kode_produk">Kode Produk</label>
                        <input type="text" class="form-control" id="kode_produk" name="kode_produk" value="{{ $produk->kode_produk }}">
                      </div>
                      <div class="form-group">
                        <label for="nama_produk">Nama Produk</label>
                        <input type="text" class="form-control" name="nama_produk" id="nama_produk"  value="{{ $produk->nama_produk }}">
                      </div>
                      <div class="form-group">
                        <label for="harga">Harga</label>
                        <input type="number" class="form-control" name="harga" id="harga" value="{{ $produk->harga }}">
                      </div>
                      <div class="form-group">
                        <label for="stok">Stok</label>
                        <input type="text" class="form-control" name="stok" id="stok" value="{{ $produk->stok }}">
                      </div>
                      <div class="form-group">
                        <label for="gambar">Foto Produk</label>
                        <input type="file"  class="form-control form-control-rounded" id="gambar" name="gambar"/>
                      </div>
                      <center>
                      <button type="submit" class="btn btn-primary me-2">Submit</button>
                      <button class="btn btn-dark">Cancel</button>
                      </center>
                    </form>
                  </div>
                </div>
              </div>
@endsection