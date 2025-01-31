import 'package:flutter/material.dart';
import 'package:uas_apm/screens/adidas_screen.dart';
import 'package:uas_apm/screens/dashboard_screen.dart';
import 'package:uas_apm/screens/katalog_screen.dart';
import 'package:uas_apm/screens/nike_screen.dart';
import 'package:uas_apm/screens/profile_screen.dart';
import 'package:uas_apm/screens/underarmour_screen.dart';
import 'screens/login_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/payment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      // Judul aplikasi
      title: 'JKT_SPORTS',
      // Rute awal aplikasi
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/katalog': (context) => const ProductCatalog(),
        '/profile': (context) => const ProfileScreen(),
        '/nike_catalog': (context) => const NikeScreen(),
        '/adidas_catalog': (context) => const AdidasScreen(),
        '/underarmour_catalog': (context) => const UnderarmourScreen(),
        '/cart': (context) => const CartScreen(),
        '/payment': (context) => const PaymentScreen(),
      },
      // Menangani rute tidak ditemukan
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
      },
    );
  }
}
