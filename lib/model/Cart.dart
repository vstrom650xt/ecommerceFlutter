import 'Product.dart';

class Cart {
  // Private constructor
  Cart._privateConstructor();

  // Singleton instance
  static final Cart _instance = Cart._privateConstructor();

  // Getter for the singleton instance
  static Cart get instance => _instance;

  // The cart items
  Map<Product, int> items = {};

  void addToCart(Product product) {
    if (items.containsKey(product)) {
      items[product] = items[product]! + 1;
    } else {
      items[product] = 1;
    }
  }

  void removeFromCart(Product product) {
    if (items.containsKey(product)) {
      items[product] = items[product]! - 1;
      if (items[product] == 0) {
        items.remove(product);
      }
    }
  }

  int getTotalItems() {
    int total = 0;
    items.forEach((product, quantity) {
      total += quantity;
    });
    return total;
  }

  @override
  String toString() {
    if (items.isEmpty) {
      return 'Carrito vacío';
    }

    String cartContent = 'Carrito:\n';
    items.forEach((product, quantity) {
      cartContent += '${product.nombre}: $quantity\n';
    });
    return cartContent;
  }

}
