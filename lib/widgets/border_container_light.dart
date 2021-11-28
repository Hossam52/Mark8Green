import 'package:flutter/material.dart';

class BorderContainerLight extends StatelessWidget {
  const BorderContainerLight({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Color(0xff50F8EF), width: 0.2),
          boxShadow: [
            BoxShadow(
              color: Color(0xff50F8EF),
              blurRadius: 3,
            ),
          ]),
      child: child,
    );
  }
}
