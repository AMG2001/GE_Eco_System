import 'package:flutter/material.dart';
import 'package:ge_machine_app/dimensions.dart';

class HomePageBackground extends StatelessWidget {
  late AssetImage image;
  HomePageBackground({required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceDimensions.width,
      height: DeviceDimensions.height,
      decoration: BoxDecoration(
        image: DecorationImage(image: image, fit: BoxFit.cover),
      ),
    );
  }
}
