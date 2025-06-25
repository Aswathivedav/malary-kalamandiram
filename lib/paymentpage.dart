import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final Function onSuccess;

  const PaymentPage({super.key, required this.onSuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Unlock Ragam")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            onSuccess(); // Unlock callback
            Navigator.pop(context); // Go back to Vocal page
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Payment Successful!")),
            );
          },
          child: const Text("Pay ₹99 to Unlock"),
        ),
      ),
    );
  }
}