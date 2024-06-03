import 'package:ecommerce/screens/adminpanel/widgets/CategoryDropdown.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddCategoryCard(),
            SizedBox(height: 16),
            AddProductCard(),
          ],
        ),
      ),
    );
  }
}

class AddCategoryCard extends StatelessWidget {
  const AddCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController categoryNameController =
    TextEditingController();
    final TextEditingController categoryUrlController =
    TextEditingController();

    void addCategory() async {
      String name = categoryNameController.text;
      String url = categoryUrlController.text;

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('categories').get();

      int newCategoryId = 1; // Valor predeterminado si no hay categorías existentes
      if (querySnapshot.docs.isNotEmpty) {
        int maxCategoryNumber = 0;
        for (var doc in querySnapshot.docs) {
          String docId = doc.id;
          int categoryNumber = int.parse(docId.split('_').last);
          if (categoryNumber > maxCategoryNumber) {
            maxCategoryNumber = categoryNumber;
          }
        }
        newCategoryId = maxCategoryNumber + 1;
      }

      // Establecer un nombre específico para el nuevo documento de categoría
      String newCategoryDocumentName = 'category_$newCategoryId';

      // Agregar la nueva categoría con el nuevo nombre de documento
      await FirebaseFirestore.instance.collection('categories').doc(newCategoryDocumentName).set({
        'name': name,
        'url': url,
      });

      categoryNameController.clear();
      categoryUrlController.clear();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DashboardScreen()));
    }


    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Agregar Categoría',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: categoryNameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(
              controller: categoryUrlController,
              decoration: const InputDecoration(labelText: 'URL'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addCategory,
              child: const Text('Agregar Categoría'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddProductCard extends StatefulWidget {
  const AddProductCard({super.key});

  @override
  _AddProductCardState createState() => _AddProductCardState();
}

class _AddProductCardState extends State<AddProductCard> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productDescriptionController = TextEditingController();
  final TextEditingController productBrandController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productUrlController = TextEditingController();
  final TextEditingController productCategoryController = TextEditingController();
  bool isMostSale = false;
  String selectedCategory = ''; // Inicializar selectedCategory con una cadena vacía
  @override
  Widget build(BuildContext context) {
    void addProduct() async {
      String description = productDescriptionController.text;
      String brand = productBrandController.text;
      String name = productNameController.text;
      double price = double.parse(productPriceController.text);
      String url = productUrlController.text;
      String category = productCategoryController.text.toLowerCase();

      // Obtener el ID autoincremental
      // final QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('productos').get();

      await FirebaseFirestore.instance.collection('productos').add({
        'descripcion': description,
        'marca': brand,
        'masVendido': isMostSale,
        'nombre': name,
        'precio': price,
        'categoria': category,
        'url': url,
      });

      productNameController.clear();
      productDescriptionController.clear();
      productBrandController.clear();
      productPriceController.clear();
      productUrlController.clear();
      productCategoryController.clear();
      setState(() {
        isMostSale = false; // Restablecer el estado del botón de alternancia después de agregar el producto
      });
    }

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Agregar Producto',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: productNameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(
              controller: productDescriptionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
            TextFormField(
              controller: productBrandController,
              decoration: const InputDecoration(labelText: 'Marca'),
            ),
            TextFormField(
              controller: productPriceController,
              decoration: const InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.numberWithOptions(decimal: true), // Permite el teclado numérico y el punto decimal
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')), // Solo permite dígitos y un punto decimal
                TextInputFormatter.withFunction((oldValue, newValue) {
                  try {
                    final text = newValue.text;
                    if (text.isNotEmpty) double.parse(text); // Intenta convertir el valor a un número flotante
                    return newValue;
                  } catch (e) {
                    // Si ocurre un error al intentar convertir, significa que se ingresó un valor no válido
                    return oldValue;
                  }
                }),
              ],
            ),
            TextFormField(
              controller: productUrlController,
              decoration: const InputDecoration(labelText: 'URL'),
            ),
            CategoryDropdown(
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                  productCategoryController.text = category; // Actualizar el controlador de categoría de productos
                });
              },
            ),
            Row(
              children: [
                const Text('¿Más vendido?'),
                Switch(
                  value: isMostSale,
                  onChanged: (value) {
                    setState(() {
                      isMostSale = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addProduct,
              child: const Text('Agregar Producto'),
            ),
          ],
        ),
      ),
    );
  }
}
