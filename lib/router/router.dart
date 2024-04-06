import 'package:ecommerce/screens/HomePage.dart';
import 'package:ecommerce/screens/sigin/SignIn.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: 'signin',
      path: '/signin',
      builder: (context, state) => const SignIn(),
    ),
  ],
);