import 'package:flutter/material.dart';
import 'login.dart';
import 'tentangsaya.dart';
import 'register.dart';
import 'beranda.dart';
import 'beranda_toko.dart'; // Menambahkan halaman beranda toko
import 'keranjang.dart';
import 'lupa_sandi.dart';
import 'logout.dart';

void main() {
  runApp(FreshMarket());
}

class FreshMarket extends StatelessWidget {
  const FreshMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh Market',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/tentangsaya': (context) => const TentangSayaScreen(),
        '/beranda': (context) => const BerandaScreen(),
        '/beranda_toko': (context) =>
            const BerandaTokoScreen(), // Menambahkan rute untuk beranda toko
        '/logout': (context) => const LogoutScreen(),
        '/keranjang': (context) => const CartScreen(
              cartItems: [],
            ),
        '/lupa_sandi': (context) => const LupaSandiScreen(),
      },
    );
  }
}
