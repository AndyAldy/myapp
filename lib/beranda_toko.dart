import 'package:flutter/material.dart';
import 'produk.dart'; // Import model Produk
import 'form_produk.dart';
import 'dart:io'; // Untuk File gambar

class BerandaTokoScreen extends StatefulWidget {
  const BerandaTokoScreen({super.key});

  @override
  _BerandaTokoScreenState createState() => _BerandaTokoScreenState();
}

class _BerandaTokoScreenState extends State<BerandaTokoScreen> {
  List<Produk> daftarProduk = []; // List untuk menyimpan data produk

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda Toko - Kasir'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Aksi untuk notifikasi
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Aksi untuk logout
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Kelola Produk Toko',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _tambahProduk(context); // Arahkan ke form tambah produk
              },
              child: const Text('Tambah Produk'),
            ),
            const SizedBox(height: 24),
            // Menampilkan daftar produk
            Expanded(
              child: ListView.builder(
                itemCount: daftarProduk.length,
                itemBuilder: (context, index) {
                  final produk = daftarProduk[index];
                  return ListTile(
                    leading: produk.gambar.isEmpty
                        ? const Icon(Icons.image)
                        : Image.file(File(produk.gambar), width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(produk.nama),
                    subtitle: Text('Harga: Rp ${produk.harga}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _hapusProduk(produk.id); // Fungsi hapus produk
                      },
                    ),
                    onTap: () {
                      _editProduk(context, produk); // Arahkan ke form edit produk
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menambah produk
  void _tambahProduk(BuildContext context) {
    // Navigasi ke halaman form tambah produk
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FormProdukScreen(onSimpan: (produk) {
        setState(() {
          daftarProduk.add(produk);
        });
      })),
    );
  }

  // Fungsi untuk mengedit produk
  void _editProduk(BuildContext context, Produk produk) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FormProdukScreen(produk: produk, onSimpan: (produkBaru) {
        setState(() {
          final index = daftarProduk.indexWhere((p) => p.id == produk.id);
          if (index != -1) {
            daftarProduk[index] = produkBaru;
          }
        });
      })),
    );
  }

  // Fungsi untuk menghapus produk
  void _hapusProduk(String id) {
    setState(() {
      daftarProduk.removeWhere((produk) => produk.id == id);
    });
  }
}
