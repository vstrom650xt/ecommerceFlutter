import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/baseurls.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Special for you",
            press: () {},
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                imageUrl: '${BaseUrls.IMGURLS}productos/raton/raton1.jpeg',
                category: "Smartphone",
                numOfBrands: 18,
                press: () {
                  Navigator.pushNamed(context, '');
                },
              ),
              SpecialOfferCard(
                imageUrl: '${BaseUrls.IMGURLS}productos/teclado/1930-forgeon-clutch-teclado-gaming-rgb-60-switch-red.webp',
                category: "Fashion",
                numOfBrands: 24,
                press: () {
                  Navigator.pushNamed(context, '');
                },
              ),
              SpecialOfferCard(
                imageUrl: '${BaseUrls.IMGURLS}productos/pantallas/pantalla1.png',
                category: "Fashion",
                numOfBrands: 24,
                press: () {
                  Navigator.pushNamed(context, '');
                },
              ),

              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.imageUrl,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, imageUrl;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
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
                Align(alignment: Alignment.centerRight,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black54,
                        Colors.black38,
                        Colors.black26,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
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
