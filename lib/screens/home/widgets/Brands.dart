import 'package:ecommerce/apicalls/product/ApiProduct.dart';
import 'package:ecommerce/constant/baseurls.dart';
import 'package:ecommerce/model/Product.dart';
import 'package:ecommerce/screens/home/widgets/section_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../product/product_details_screen.dart';
import '../../product/products_screen.dart';

class SpecialOffers extends StatefulWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  _SpecialOffersState createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  late Future<List<Product>> _productBrench;

  @override
  void initState() {
    super.initState();
    _productBrench = ApiProduct().fetchProductsBrench();
  }

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      BaseUrls.IMGURLS + '/marcas/Steel.png',
      BaseUrls.IMGURLS + '/marcas/Forgeon.png',
      BaseUrls.IMGURLS + '/marcas/Razer.png',
      BaseUrls.IMGURLS + '/marcas/Tempest.png',
      BaseUrls.IMGURLS + '/marcas/hp.png',
    ];

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Marcas",
          ),
        ),
        SizedBox(
          height: 100,
          child: FutureBuilder<List<Product>>(
            future: _productBrench,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length, // Usar la longitud de la lista de productos
                  itemBuilder: (context, index) {
                    return _buildSpecialOffer(
                      imageUrl: imageUrls[index], // Pasa la URL manualmente
                      name: snapshot.data![index].marca,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductsScreen(brand: snapshot.data![index].marca, category: null,),
                          ),
                        );
                      },

                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('No special offers available'),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialOffer({
    required String imageUrl,
    required String name,
    required GestureTapCallback press,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 242,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black87,
                          Colors.black54,
                          Colors.black38,
                          Colors.black26,
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
