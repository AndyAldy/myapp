import 'package:flutter/material.dart';

class LupaSandiScreen extends StatelessWidget {
  const LupaSandiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        title: const Text('Lupa Kata Sandi'),
        backgroundColor: const Color(0xFF98FB98), // Sage Green
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Masukkan Email Anda untuk Mengatur Ulang Kata Sandi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Input Email
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 16),
            // Tombol Kirim Link Reset
            ElevatedButton(
              onPressed: () {
                // Aksi kirim link reset kata sandi
                // Misalnya, kirim email atau tampilkan pesan sukses
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Link reset kata sandi telah dikirim!')),
                );
                Navigator.pop(context); // Kembali ke halaman login setelah sukses
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF98FB98), // Sage Green
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                'Kirim Link Reset',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            // Tombol Kembali ke Login
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman login
              },
              child: const Text(
                'Kembali ke Login',
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
