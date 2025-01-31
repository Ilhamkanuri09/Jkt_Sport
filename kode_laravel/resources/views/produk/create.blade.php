@extends('layout')
@section('content')
<div class="col-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body"><br></br>
                    <h2 class="card-title">Input Data Produk</h2>
                    <form class="forms-sample" action="{{ route('Produk.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                      <div class="form-group">
                        <label>Kode Produk</label>
                        <input type="text" class="form-control" name="kode_produk" placeholder="Input Kode Produk">
                      </div>
                      <div class="form-group">
                        <label>Nama Produk</label>
                        <input type="text" class="form-control" name="nama_produk" placeholder="Input Nama Produk">
                      </div>
                      <div class="form-group">
                        <label>Harga</label>
                        <input type="number" class="form-control" name="harga" placeholder="Input Harga">
                      </div>
                      <div class="form-group">
                        <label>Stok</label>
                        <input type="text" class="form-control" name="stok" placeholder="Input Stok">
                      </div>
                      <div class="form-group">
                        <label>Foto Produk</label>
                        <input type="file"  class="form-control form-control-rounded" name="gambar"/>
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