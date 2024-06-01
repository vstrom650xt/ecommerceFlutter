import 'package:flutter/material.dart';
import 'package:ecommerce/model/Cart.dart';
import 'components/cart_card.dart'; // Importa el CartCard
import 'components/check_out_card.dart'; // Importa la pantalla de pago

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

    // Calcular el total del monto en el carrito
    double totalAmount = 0;
    cart.items.forEach((product, quantity) {
      totalAmount += product.precio * quantity;
    });

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
                  return CartCard(
                    product: product,
                    quantity: quantity,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutCard(
                        totalAmount: totalAmount,
                        onCheckoutPressed: () {
                          // Implementa la funcionalidad de pago aquí
                        },
                      ),
                    ),
                  );
                },
                child: Text('Precio final \$${totalAmount.toStringAsFixed(2)}'), // Aquí se muestra el total a pagar en el botón
              ),
            ),
          ],
        ),
      ),
    );
  }
}
