<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('tbl_produk', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('kode_produk');
            $table->string('nama_produk');
            $table->double('harga', 15, 8);
            $table->integer('stok');
            $table->text('gambar');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tbl_produk');
    }
};
