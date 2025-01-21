import 'package:flutter/material.dart';
import 'pembayaran_berhasil.dart';
import 'produk.dart'; // Model Produk

class CheckoutScreen extends StatelessWidget {
  final List<Produk> cartItems;

  const CheckoutScreen({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double totalHarga = 0;
    for (var item in cartItems) {
      totalHarga += item.harga;
    }

    double ongkosKirim = 10000; // Ongkos kirim tetap
    double totalPembayaran = totalHarga + ongkosKirim;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Alamat Pengiriman', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Tempat Akurat, Jl.xxxxxxxxxx'),
            const SizedBox(height: 16),
            const Text('Ringkasan Belanja', style: TextStyle(fontWeight: FontWeight.bold)),
            ...cartItems.map((produk) => ListTile(
                  leading: Image.network(
                    produk.gambar,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(produk.nama),
                  subtitle: Text('Rp ${produk.harga.toStringAsFixed(0)}'),
                )),
            const SizedBox(height: 16),
            const Text('Metode Pembayaran', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Virtual Account'),
            const SizedBox(height: 16),
            const Text('Ringkasan Pembayaran', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Total Harga: Rp ${totalHarga.toStringAsFixed(0)}'),
            Text('Ongkos Kirim: Rp ${ongkosKirim.toStringAsFixed(0)}'),
            Text('Total Pembayaran: Rp ${totalPembayaran.toStringAsFixed(0)}'),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PembayaranBerhasilScreen(
                        totalPembayaran: totalPembayaran,
                      ),
                    ),
                  );
                },
                child: const Text('Bayar Sekarang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
