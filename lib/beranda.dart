import 'package:flutter/material.dart';
import 'keranjang.dart'; // Keranjang Belanja
// Profil Pengguna
import 'produk.dart'; // Model Produk

// Daftar produk yang akan ditampilkan
final List<Produk> produkList = [
  Produk(
      id: '1',
      nama: 'Apel',
      harga: 10.0,
      deskripsi: 'Apel segar dan manis',
      gambar: 'img/apel.png'),
  Produk(
      id: '2',
      nama: 'Jeruk',
      harga: 12.0,
      deskripsi: 'Jeruk segar dengan vitamin C tinggi',
      gambar: 'img/jeruk.png'),
  Produk(
      id: '3',
      nama: 'Pisang',
      harga: 8.0,
      deskripsi: 'Pisang matang dan lezat',
      gambar: 'img/pisang.png'),
  Produk(
      id: '4',
      nama: 'Tomat',
      harga: 5.0,
      deskripsi: 'Tomat segar dan kaya nutrisi',
      gambar: 'img/tomat.png'),
];

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  _BerandaScreenState createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  // Menyimpan produk yang ditambahkan ke keranjang
  List<Produk> keranjang = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda - Fresh Market'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigasi ke halaman keranjang dan mengirim data keranjang
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(
                      cartItems: keranjang), // Kirimkan keranjang ke CartScreen
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/tentangsaya');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat datang di Fresh Market!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/produk'); // Arahkan ke halaman produk
              },
              child: const Text('Mulai Belanja'),
            ),
            const SizedBox(height: 24),

            // Daftar Produk
            const Text(
              'Produk yang Tersedia',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Menampilkan daftar produk
            Expanded(
              child: ListView.builder(
                itemCount: produkList.length,
                itemBuilder: (context, index) {
                  final produk = produkList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.network(produk.gambar,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover), // Menampilkan gambar
                      title: Text(produk.nama),
                      subtitle: Text(
                          'Harga: Rp ${produk.harga}\n${produk.deskripsi}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          setState(() {
                            // Menambahkan produk ke keranjang
                            keranjang.add(produk);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    '${produk.nama} telah ditambahkan ke keranjang')),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            )
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
        backgroundColor: Colors.black, // Latar belakang hitam
        selectedItemColor:
            Colors.white, // Warna ikon dan label item terpilih menjadi putih
        unselectedItemColor: Colors
            .grey, // Warna ikon dan label item tidak terpilih menjadi abu-abu
      ),
    );
  }
}
