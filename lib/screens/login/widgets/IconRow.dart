import 'package:ecommerce/apicalls/auth/ProvidersAuth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/constant/baseurls.dart';
import 'package:ecommerce/screens/home/home_screen.dart';

class IconRow extends StatelessWidget {
  const IconRow({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: CupertinoButton(
            child: Image.network(
              '${BaseUrls.IMGURLS}iconos/google.png',
              height: height * 0.08,
            ),
            onPressed: () async {
              // Sign in with Google
              final result = await Auth.signInWithGoogle();
              if (result != null) {
                // Sign-in successful, navigate to HomeScreen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              } else {
                // Sign-in failed
                // Handle the case where sign-in was not successful
              }
            },
          ),
        ),

      ],
    );
  }
}
