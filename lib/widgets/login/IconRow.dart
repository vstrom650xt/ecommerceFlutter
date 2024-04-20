import 'package:ecommerce/apicalls/auth/ProvidersAuth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/baseurls.dart';

class IconRow extends StatelessWidget {
  const IconRow({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        CupertinoButton(
            child: Image.network(
              '${BaseUrls.IMGURLS}iconos/google.png',
              height: height * 0.07,
            ),
            onPressed: () {
              Auth.signInWithGoogle();
            }),
        const SizedBox(),
        CupertinoButton(
            child: Icon(
                Icons.facebook, color: Colors.blue, size: height * 0.08),
            onPressed: () {
              Auth.signInWithFacebook();
            })
      ],
    );
  }
}
