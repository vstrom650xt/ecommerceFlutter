import 'package:flutter/cupertino.dart';
import 'package:getwidget/getwidget.dart';

import '../../constant/baseurls.dart';

class CustomCircleImage extends StatelessWidget {
  const CustomCircleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: GFImageOverlay(
        height: 250,
        width: 250,
        shape: BoxShape.circle,
        image: NetworkImage('${BaseUrls.IMGURLS}corporativa/logoBackground.png'),
        boxFit: BoxFit.cover,
      ),
    );
  }
}
