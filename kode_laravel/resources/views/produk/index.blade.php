@extends('layout')
@section('content')
<div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <br></br>
                    <h2 class="card-title">Data Produk</h2>
                    <div class="table-responsive">
                    @if($message = Session::get('success'))
                    <div class="alert alert-success">
                        <p>{{$message}}</p>
                    </div>
                    @endif      
                    <p></p>
                    <a class="btn btn-success" href="{{ route('Produk.create') }}"> Tambah Data Produk</a>
                    <p></p>
                      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                          <tr align="center">
                            <th> No. </th>
                            <th> Foto </th>
                            <th> Kode Produk </th>
                            <th> Nama Produk </th>
                            <th> Harga </th>
                            <th> Stok </th>
                            <th>Action</th>
                          </tr>
                        </thead>
                        <tfoot>
                          <tr align="center">
                            <th> No. </th>
                            <th> Foto </th>
                            <th> Kode Produk </th>
                            <th> Nama Produk </th>
                            <th> Harga </th>
                            <th> Stok </th>
                            <th>Action</th>
                          </tr>
                        </tfoot>
                        <tbody>  
                        @foreach($produks as $produk)
                          <tr align="center">
                            <td>{{ ++$i }}</td>
                            <td><img width="150px" align="center" src="{{ url('/data_file/'.$produk->gambar) }}"></td>
                            <td>{{ $produk ->kode_produk }}</td>
                            <td>{{ $produk ->nama_produk }}</td>
                            <td>{{ $produk ->harga }}</td>
                            <td>{{ $produk ->stok }}</td>
                            <td>
                              <form action="{{ route('Produk.destroy', $produk->id) }}" method="POST">
                                @csrf
                                @method('DELETE')
                                <a class="btn btn-warning" href="{{ route('Produk.edit', $produk->id) }}">
                                <i class="fas fa-edit"></i>Edit</a>
                                <button type="submit" class="btn btn-danger" onclick="javascript: return confirm('Apakah Anda Ingin Menghapus Data Ini')">
                                <i class="fas fa-trash"></i>Hapus</button>
                              </form>
                            </td>
                          </tr>
                    @endforeach
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
              @endsection