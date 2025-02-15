<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Produk extends Model
{
    use HasFactory;

    public $table ="tbl_produk";
    
    protected $fillable = [
        'id','kode_produk','nama_produk','harga','stok','gambar'
    ];
}