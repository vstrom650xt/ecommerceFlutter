import 'package:flutter/material.dart';

import '../../widgets/home/categories.dart';
import '../../widgets/home/discount_banner.dart';
import '../../widgets/home/home_header.dart';
import '../../widgets/home/popular_product.dart';
import '../../widgets/home/special_offers.dart';

import '../../responsive/ResponsiveWidget.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ResponsiveWidget(
          largeScreen: LargeScreenContent(),
          mediumScreen: MediumScreenContent(),
          smallScreen: SmallScreenContent(),
        ),
      ),
    );
  }
}

class LargeScreenContent extends StatelessWidget {
  const LargeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          HomeHeader(),
          Categories(),
          DiscountBanner(),
          SpecialOffers(),
          SizedBox(height: 20),
          PopularProducts(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class MediumScreenContent extends StatelessWidget {
  const MediumScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          HomeHeader(),
          Categories(),
          DiscountBanner(),
          SpecialOffers(),
          SizedBox(height: 20),
          PopularProducts(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class SmallScreenContent extends StatelessWidget {
  const SmallScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          HomeHeader(),
          DiscountBanner(),
          Categories(),
          SpecialOffers(),
          SizedBox(height: 40),
          PopularProducts(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
