import 'package:flutter/material.dart';
import 'produk.dart'; // Import model Produk

class CartScreen extends StatelessWidget {
  final List<Produk> cartItems;

  const CartScreen({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
      ),
      body: cartItems.isNotEmpty
          ? ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final produk = cartItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    leading: Image.network(
                      produk.gambar,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(produk.nama),
                    subtitle: Text('Harga: Rp ${produk.harga}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // Logika untuk menghapus produk dari keranjang
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                '${produk.nama} telah dihapus dari keranjang'),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text('Keranjang belanja kosong.'),
            ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              // Logika untuk melanjutkan ke checkout
              Navigator.pushNamed(context, '/checkout');
            },
            child: const Text('Checkout'),
          ),
        ),
      ),
    );
  }
}
