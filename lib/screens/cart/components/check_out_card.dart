import 'package:flutter/material.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
    required this.totalAmount,
    required this.onCheckoutPressed,
  }) : super(key: key);

  final double totalAmount;
  final VoidCallback onCheckoutPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.receipt, color: Colors.blue),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () {
                  // Implementa la funcionalidad del código de cupón aquí
                },
                icon: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blue),
                label: const Text("Agregar código de cupón", style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Total:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "\$$totalAmount",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onCheckoutPressed,
            child: const Text("Realizar pago", style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
