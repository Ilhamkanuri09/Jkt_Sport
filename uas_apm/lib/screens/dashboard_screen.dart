import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'katalog_screen.dart';
import 'profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  // Daftar layar untuk navigasi bottom bar
  final List<Widget> _screens = [
    const DashboardHomeScreen(), // Layar utama Dashboard
    const ProductCatalog(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Menampilkan layar berdasarkan index
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Catalog'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// Widget untuk halaman utama dashboard
class DashboardHomeScreen extends StatelessWidget {
  const DashboardHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(64, 97, 122, 1.0),
            Color.fromRGBO(226, 237, 245, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Carousel Slider
          CarouselSlider(
            items: [
              buildSliderImage('assets/images/adidas.jpeg'),
              buildSliderImage('assets/images/under.jpeg'),
              buildSliderImage('assets/images/nike.jpeg'),
            ],
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          const SizedBox(height: 20),

          // Featured Brands Section
          buildSectionHeader("Featured Brands", "View More", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductCatalog()),
            );
          }),
          const SizedBox(height: 10),
          // Trending Product Section
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildTrendingProduct(
                  name: "Manset Cewe",
                  brand: "Nike",
                  price: 30,
                  imageUrl: 'assets/images/manset_cewe.png',
                ),
                buildTrendingProduct(
                  name: "Sweater",
                  brand: "Under Armour",
                  price: 50,
                  imageUrl: 'assets/images/sweater.png',
                ),
                buildTrendingProduct(
                  name: "Celana Pendek",
                  brand: "Adidas",
                  price: 40,
                  imageUrl: 'assets/images/celana_pendek.png',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Promotional Section
          buildPromotionalSection(context),
        ],
      ),
    );
  }

  Widget buildSliderImage(String url) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildBrandIcon(String url, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(url),
          radius: 30,
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget buildTrendingProduct({
    required String name,
    required String brand,
    required double price,
    required String imageUrl,
  }) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(brand, style: TextStyle(color: Colors.grey[600])),
                const SizedBox(height: 5),
                Text("\$${price.toStringAsFixed(2)}", style: TextStyle(fontSize: 14, color: Colors.blue[900])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSectionHeader(String title, String actionText, VoidCallback onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(onPressed: onPressed, child: Text(actionText)),
      ],
    );
  }

  Widget buildPromotionalSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2))],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "You'll Love These",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "A product that is very convincing for customers who want to buy this product!",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/katalog');// Add relevant navigation or action here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text("Explore"),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/images/images18.png', // Pastikan jalur benar
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
