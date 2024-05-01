import 'package:ecommerce/screens/home/widgets/popular_product.dart';
import 'package:ecommerce/screens/home/widgets/special_offers.dart';
import 'package:flutter/material.dart';

import 'widgets/categories.dart';
import 'widgets/discount_banner.dart';
import 'widgets/home_header.dart';

import '../../responsive/ResponsiveWidget.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({Key? key});

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
  const LargeScreenContent({
    Key? key,
  });

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
  const MediumScreenContent({Key? key});

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
  const SmallScreenContent({
    Key? key,
  });

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
