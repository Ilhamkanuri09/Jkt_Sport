import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedPaymentMethod = 'Credit Card'; // Metode pembayaran default

  @override
  Widget build(BuildContext context) {
    // Dapatkan argumen dengan validasi
    final Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final List<Map<String, dynamic>> cartItems = args?['cartItems'] ?? [];
    final double totalPrice = args?['totalPrice'] ?? 0.0;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Payment',
        returnToDashboard: false, // Set true jika ingin kembali ke Dashboard
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'No items to checkout!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Summary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return ListTile(
                          title: Text(item['name']),
                          trailing: Text(
                              '\$${(item['price'] * item['quantity']).toStringAsFixed(2)}'),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  Text(
                    'Total: \$${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Pilihan Metode Pembayaran
                  const Text(
                    'Payment Method',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  DropdownButton<String>(
                    value: _selectedPaymentMethod,
                    items: const [
                      DropdownMenuItem(
                        value: 'Credit Card',
                        child: Text('Credit Card'),
                      ),
                      DropdownMenuItem(
                        value: 'Bank Transfer',
                        child: Text('Bank Transfer'),
                      ),
                      DropdownMenuItem(
                        value: 'Cash on Delivery',
                        child: Text('Cash on Delivery'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value!;
                      });
                    },
                    isExpanded: true,
                  ),
                  const SizedBox(height: 20),

                  // Tombol Pay Now
                  ElevatedButton(
                    onPressed: () {
                      // Menampilkan dialog pembayaran berhasil
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Payment Successful'),
                          content: const Text('Your payment has been successfully processed!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close dialog
                                Navigator.pushReplacementNamed(context, '/katalog');
                              },
                              child: const Text('Back to Catalog'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close dialog
                                Navigator.pushReplacementNamed(context, '/dashboard');
                              },
                              child: const Text('Go to Dashboard'),
                            ),
                          ],
                        ),
                      );

                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.blue[900],
                    ),
                    child: const Center(
                      child: Text(
                        'Pay Now',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
