import 'package:flutter/material.dart';
import 'package:ecommerce/model/Cart.dart'; // Importa el modelo del carrito

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // Obtén la instancia del carrito
    Cart cart = Cart.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tu Carrito"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Productos en tu carrito:",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  var product = cart.items.keys.elementAt(index);
                  var quantity = cart.items.values.elementAt(index);
                  return ListTile(
                    title: Text(product.nombre),
                    subtitle: Text("Cantidad: $quantity"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
