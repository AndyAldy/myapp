class Produk {
  String id;
  String nama;
  String deskripsi;
  double harga;
  String gambar; // Menambahkan field untuk gambar

  Produk({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.harga,
    required this.gambar, // Menambahkan gambar
  });
}
