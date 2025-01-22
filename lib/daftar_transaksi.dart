import 'package:flutter/material.dart';
import 'produk.dart'; // Model Produk
import 'dart:io';

class DaftarTransaksiScreen extends StatelessWidget {
  final List<Produk> produkDibeli;
  final double totalPembayaran;
  final String tanggal;

  const DaftarTransaksiScreen({
    super.key,
    required this.produkDibeli,
    required this.totalPembayaran,
    required this.tanggal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Transaksi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Daftar Transaksi
            Expanded(
              child: ListView.builder(
                itemCount: produkDibeli.length,
                itemBuilder: (context, index) {
                  final produk = produkDibeli[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Fresh Market',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Dikemas',
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Image.network(
                                produk.gambar ,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(produk.nama),
                                    Text(
                                      tanggal,
                                      style: const TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text('Total x Produk: Rp ${totalPembayaran.toStringAsFixed(0)}'),
                          const SizedBox(height: 8),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigasi ke Beranda atau CheckoutScreen
                              },
                              child: const Text('Beli Lagi'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Produk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in),
            label: 'Pesanan',
          ),
        ],
        currentIndex: 0, // Indeks yang aktif, bisa diubah berdasarkan navigasi
        onTap: (index) {
          // Aksi untuk navigasi sesuai dengan index
          switch (index) {
            case 0:
              // Beranda - sudah di sini
              break;
            case 1:
              Navigator.pushNamed(
                  context, '/produk'); // Navigasi ke halaman produk
              break;
            case 2:
              // Chat - halaman chat
              break;
            case 3:
              Navigator.pushNamed(
                  context, '/pesanan'); // Navigasi ke halaman pesanan
              break;
          }
        },
      ),
    );
  }
}
