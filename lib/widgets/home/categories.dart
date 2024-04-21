import 'package:ecommerce/apicalls/category/ApiCategory.dart';
import 'package:ecommerce/model/Category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Future<List<Category>> _categoriesFuture; // Estado futuro de la lista de categorías

  @override
  void initState() {
    super.initState();
    // Inicializa la llamada a la API para obtener las categorías cuando se inicia el widget
    _categoriesFuture = ApiCategory().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: FutureBuilder<List<Category>>(
        future: _categoriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  snapshot.data!.length,
                      (index) => CategoryCard(
                    imageUrl: snapshot.data![index].url, // Cambiado de 'icon' a 'imageUrl'
                    text: snapshot.data![index].name,
                    press: () {},
                  ),
                ),
              ),
            );
          } else {
            // Muestra un mensaje predeterminado si no hay datos
            return Text('No hay categorías disponibles');
          }
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.imageUrl,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String imageUrl, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:10 ,right: 10),
            child: Container(
              padding: const EdgeInsets.all(16),
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: imageUrl.isNotEmpty
                  ? Image.network(
                imageUrl,
                fit: BoxFit.fill,
              )
                  : Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 4),
          Text(text, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
