import 'package:driver_app/widgets/custom_toggle_buttons.dart';
import 'package:flutter/material.dart';

class AppBarWithToggleButtons extends StatelessWidget {
  const AppBarWithToggleButtons({Key? key, required this.toggleButtons})
      : super(key: key);
  final double toggleHeight = 65;
  final CustomToggleButtons toggleButtons;
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar();
    final appBarHeight = appBar.preferredSize.height;
    final height = appBarHeight + toggleHeight / 2;
    return Container(
      height: height,
      child: Stack(
        children: [
          SizedBox(height: appBarHeight, child: appBar),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: toggleHeight,
              child: Center(child: toggleButtons),
            ),
          ),
        ],
      ),
    );
  }
}
