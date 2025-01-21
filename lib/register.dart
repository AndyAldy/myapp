import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman login
          },
        ),
        title: const Text('Daftar Akun'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input Nama Lengkap
            const TextField(
              decoration: InputDecoration(labelText: 'Nama Lengkap'),
            ),
            // Input Email
            const TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            // Input Password
            const TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            // Input Konfirmasi Password
            const TextField(
              decoration: InputDecoration(labelText: 'Konfirmasi Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            // Tombol Daftar
            ElevatedButton(
              onPressed: () {
                // Aksi registrasi
                Navigator.pushReplacementNamed(context, '/beranda');
              },
              child: const Text('Daftar'),
            ),
            // Tombol Sudah Punya Akun
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman login
              },
              child: const Text('Sudah punya akun? Login di sini'),
            ),
          ],
        ),
      ),
    );
  }
}
