import 'package:flutter/material.dart';
import 'produk.dart';
import 'daftar_transaksi.dart';


class PembayaranBerhasilScreen extends StatelessWidget {
  final double totalPembayaran;

  const PembayaranBerhasilScreen({super.key, required this.totalPembayaran});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran Berhasil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 100, color: Colors.green),
            const SizedBox(height: 16),
            const Text(
              'Selamat, Pembayaranmu Berhasil',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Pesanan akan segera diteruskan ke penjual.\nSilahkan cek status pesananmu di Daftar Transaksi',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                title: const Text('Virtual Account'),
                trailing: Text('Rp ${totalPembayaran.toStringAsFixed(0)}'),
              ),
            ),
            const SizedBox(height: 24),
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DaftarTransaksiScreen(
          produkDibeli: [Produk(nama: 'Produk Dibeli', harga: totalPembayaran, gambar: '', id: '', deskripsi: '')],
          totalPembayaran: totalPembayaran,
          tanggal: '20 Januari 2025', // Ambil tanggal saat ini secara dinamis
        ),
      ),
    );
  },
  child: const Text('Lihat Daftar Transaksi'),
),
          ],
        ),
      ),
    );
  }
}
