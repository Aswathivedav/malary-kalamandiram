import 'package:flutter/material.dart';

class FeePage extends StatelessWidget {
  const FeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fee Structure"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Vocal",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text("Advance: ₹700"),
            const Text("Monthly: ₹500"),
            const Divider(height: 32),

            const Text(
              "Keyboard / Violin / Guitar",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text("Advance: ₹1000"),
            const Text("Monthly: ₹700"),
            const SizedBox(height: 40),

            const Text(
              "Payment Options",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {
                // Add QR or UPI payment integration
              },
              icon: const Icon(Icons.qr_code),
              label: const Text("Pay via QR Code"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Add UPI ID copy or deep link
              },
              icon: const Icon(Icons.payment),
              label: const Text("Pay via UPI"),
            ),
          ],
        ),
      ),
    );
  }
}