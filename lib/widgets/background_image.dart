import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final double? height;
  final String imagePath;
  const BackgroundImage(this.imagePath, {Key? key, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      child: Image.asset(
        imagePath,
        fit: BoxFit.fill,
      ),
    );
  }
}
