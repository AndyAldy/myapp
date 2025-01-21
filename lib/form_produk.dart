import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'produk.dart'; // Import model Produk
import 'dart:io'; // Untuk File gambar

class FormProdukScreen extends StatefulWidget {
  final Produk? produk;
  final Function(Produk) onSimpan;

  FormProdukScreen({super.key, this.produk, required this.onSimpan});

  @override
  _FormProdukScreenState createState() => _FormProdukScreenState();
}

class _FormProdukScreenState extends State<FormProdukScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _namaController;
  late TextEditingController _deskripsiController;
  late TextEditingController _hargaController;
  String? _gambar; // Menyimpan path gambar

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller
    _namaController = TextEditingController(text: widget.produk?.nama ?? '');
    _deskripsiController = TextEditingController(text: widget.produk?.deskripsi ?? '');
    _hargaController = TextEditingController(text: widget.produk?.harga.toString() ?? '');
    _gambar = widget.produk?.gambar; // Inisialisasi gambar jika ada
  }

  @override
  void dispose() {
    _namaController.dispose();
    _deskripsiController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  Future<void> _ambilGambar() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _gambar = pickedFile.path; // Menyimpan path gambar
      });
    }
  }

  void _simpanProduk() {
    if (_formKey.currentState?.validate() ?? false) {
      final produk = Produk(
        id: widget.produk?.id ?? DateTime.now().toString(), // ID baru jika produk baru
        nama: _namaController.text,
        deskripsi: _deskripsiController.text,
        harga: double.parse(_hargaController.text),
        gambar: _gambar ?? '', // Menyimpan gambar yang dipilih
      );
      widget.onSimpan(produk);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produk == null ? 'Tambah Produk' : 'Edit Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: 'Nama Produk'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Nama produk tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _deskripsiController,
                decoration: const InputDecoration(labelText: 'Deskripsi'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Deskripsi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _hargaController,
                decoration: const InputDecoration(labelText: 'Harga'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Harga tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _gambar == null
                  ? const Text('Pilih Gambar Produk')
                  : Image.file(File(_gambar!), width: 100, height: 100, fit: BoxFit.cover),
              ElevatedButton(
                onPressed: _ambilGambar,
                child: const Text('Pilih Gambar'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _simpanProduk,
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
