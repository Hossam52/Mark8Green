import 'package:flutter/material.dart';

class CancelItem extends StatelessWidget {
  const CancelItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print(constraints);
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          width: MediaQuery.of(context).size.width *
              0.06, //  _getWidth(constraints),
          height: MediaQuery.of(context).size.height * 0.019, // 25,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(7))),
          child: Divider(
            thickness: 2,
            color: Colors.white,
          ));
    });
  }

  double _getWidth(BoxConstraints constraints) {
    if (constraints.hasBoundedWidth)
      return constraints.maxWidth * 0.28;
    else if (constraints.hasBoundedHeight)
      return constraints.maxHeight * 0.22;
    else
      return 40;
  }

  // double _geheight(BoxConstraints constraints) {
  //   if (constraints.hasBoundedHeight)
  //     return constraints.maxHeight * 0.17;
  //   else if (constraints.hasBoundedHeight)
  //     return constraints.maxWidth * 0.2;
  //   else
  //     return 50;
  // }
}
