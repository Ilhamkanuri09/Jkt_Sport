// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:uas_apm/widgets/custom_appbar.dart';
import 'dashboard_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';
import 'adidas_screen.dart';
import 'nike_screen.dart';
import 'underarmour_screen.dart';

class ProductCatalog extends StatefulWidget {
  const ProductCatalog({super.key});

  @override
  State<ProductCatalog> createState() => _ProductCatalogState();
}

class _ProductCatalogState extends State<ProductCatalog> {
// Index untuk tab Katalog

  // ignore: unused_field
  final List<Widget> _screens = [
    DashboardScreen(),
    ProductCatalog(), // Layar Katalog
    CartScreen(),
    ProfileScreen(),
  ];

  final List<Map<String, String>> products = [
    {
      "image": 'assets/images/adidas.png',
      "brand": "Adidas",
      "route": "adidas",
    },
    {
      "image": 'assets/images/nike.png',
      "brand": "Nike",
      "route": "nike",
    },
    {
      "image": 'assets/images/under.png',
      "brand": "Under Armour",
      "route": "under_armour",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Katalog',
        returnToDashboard: true, // Set true jika ingin kembali ke Dashboard
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(
              image: product["image"]!,
              brand: product["brand"]!,
              route: product["route"]!,
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String brand;
  final String route;

  const ProductCard({
    super.key,
    required this.image,
    required this.brand,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            padding: EdgeInsets.all(8.0),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brand,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      _navigateToProduct(context, route);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Beli Sekarang"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToProduct(BuildContext context, String route) {
    if (route == "adidas") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdidasScreen()),
      );
    } else if (route == "nike") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NikeScreen()),
      );
    } else if (route == "under_armour") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UnderarmourScreen()),
      );
    }
  }
}
