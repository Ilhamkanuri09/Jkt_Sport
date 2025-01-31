import 'package:flutter/material.dart';

class AdidasScreen extends StatefulWidget {
  const AdidasScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdidasScreenState createState() => _AdidasScreenState();
}

class _AdidasScreenState extends State<AdidasScreen> {
  final List<Map<String, dynamic>> products = [
    {"name": "Baju Pendek", "price": 20.00, "quantity": 0, "image": "assets/images/baju_pendek3.png"},
    {"name": "Lekton", "price": 35.00, "quantity": 0, "image": "assets/images/celana_manset_panjang.png"},
    {"name": "Celana Manset", "price": 45.00, "quantity": 0, "image": "assets/images/satu_set2.png"},
    {"name": "Jaket", "price": 45.00, "quantity": 0, "image": "assets/images/celana_pendek2.png"},
    {"name": "Manset Panjang", "price": 25.00, "quantity": 0, "image": "assets/images/jaket3.png"},
    {"name": "Celana Pendek", "price": 20.00, "quantity": 0, "image": "assets/images/manset.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang Adidas"),
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        children: [
          // Header dengan logo Adidas
          Container(
            color: Colors.blue[100],
            height: 150,
            child: Center(
              child: Image.asset(
                'assets/images/adidas.png', // Pastikan jalur gambar benar
                height: 80,
              ),
            ),
          ),

          // Daftar produk
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Gambar Produk
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              product['image'],
                              fit: BoxFit.cover,
                            ),
                          ),

                          // Detail Produk
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product['name'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text("\$${product['price'].toStringAsFixed(2)}"),
                                ],
                              ),
                            ),
                          ),

                          // Kontrol Kuantitas
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (product['quantity'] > 0) {
                                      product['quantity']--;
                                    }
                                  });
                                },
                                icon: const Icon(Icons.remove),
                              ),
                              Text(
                                product['quantity'].toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    product['quantity']++;
                                  });
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Produk yang dipilih untuk keranjang
          final cartItems =
              products.where((product) => product['quantity'] > 0).toList();
          Navigator.pushNamed(
            context,
            '/cart',
            arguments: {'cartItems': cartItems},
          );
        },
        label: const Text("Go to Cart"),
        icon: const Icon(Icons.shopping_cart),
        backgroundColor: Colors.blue[900],
      ),
    );
  }
}
