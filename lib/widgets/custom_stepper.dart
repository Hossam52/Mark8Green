import 'dart:math';

import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

// const completeColor = Colors.black;
// const inProgressColor = Colors.blue;
const todoColor = Color(0xffd1d2d7);

class CustomStepper extends StatefulWidget {
  final List<StepDescription> steppers;
  final int currentStep;
  CustomStepper(this.steppers, this.currentStep);
  @override
  _CustomStepperPageState createState() => _CustomStepperPageState();
}

class _CustomStepperPageState extends State<CustomStepper> {
  Color getColor(int index) {
    if (index == widget.currentStep) {
      return Theme.of(context).primaryColor; // inProgressColor;
    } else if (index < widget.currentStep) {
      return Colors.black;
    } else {
      return todoColor;
    }
  }

  double fontSize = 13;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return LayoutBuilder(builder: (context, constraints) {
      return Timeline.tileBuilder(
        theme: TimelineThemeData(
          direction: Axis.horizontal,
          connectorTheme: _connectorTheme(primaryColor),
        ),
        builder: TimelineTileBuilder.connected(
          itemExtentBuilder: (_, __) =>
              constraints.maxWidth / widget.steppers.length,
          contentsBuilder: (context, index) {
            return _buildStepperContent(index);
          },
          indicatorBuilder: (_, index) => _buildNodes(_, index, primaryColor),
          connectorBuilder: (_, index, type) => SolidLineConnector(),
          itemCount: widget.steppers.length,
        ),
      );
    });
  }

  Widget? _buildNodes(_, index, Color nodeColor) {
    double nodeSize = 40;
    var child = Center(
      child: Text(
        widget.steppers[index].nodeTitle ?? '${index + 1}',
        style: getRegularStyle(
            fontSize: fontSize,
            color: index > widget.currentStep ? Colors.black : Colors.white),
      ),
    );

    if (index == widget.currentStep)
      return DotIndicator(
        size: nodeSize,
        child: child,
        color: nodeColor,
        border: Border.all(),
      );
    if (index < widget.currentStep)
      return InkWell(
          onTap: widget.steppers[index].onPressed,
          child: DotIndicator(
            size: nodeSize,
            child: child,
            color: nodeColor,
          ));
    else
      return Builder(builder: (context) {
        return DotIndicator(
          size: nodeSize,
          child: child,
          color: Colors.white,
          border: Border.all(color: Theme.of(context).primaryColor),
        );
      });
  }

  Widget _buildStepperContent(int index) {
    return InkWell(
      onTap: widget.steppers[index].onPressed,
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  widget.steppers[index].title,
                  style: getBoldStyle(
                    fontSize: fontSize,
                    color: getColor(index),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ConnectorThemeData _connectorTheme(Color color) {
    return ConnectorThemeData(thickness: 5.0, color: color);
  }
}

class StepDescription {
  String title;
  Widget page;
  String? nodeTitle;
  VoidCallback onPressed;
  StepDescription(this.title, this.onPressed,
      {required this.page, this.nodeTitle});
}





// class _Test extends StatelessWidget {
//   const _Test({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //Depends on package timeline_tile 
//     return Center(
//       child: Container(
//         constraints: const BoxConstraints(maxHeight: 120),
//         color: Colors.white,
//         child: ListView(
//           scrollDirection: Axis.horizontal,
//           shrinkWrap: true,
//           children: [
//             TimelineTile(
//               axis: TimelineAxis.horizontal,
//               alignment: TimelineAlign.start,
//               // lineXY: 0.1,
//               isFirst: true,
//               indicatorStyle: IndicatorStyle(
//                   height: 20,
//                   // color: Colors.blue,
//                   indicator: Container(
//                     decoration: BoxDecoration(border: Border.all()),
//                   )),

//               beforeLineStyle: const LineStyle(
//                 color: Colors.green,
//                 thickness: 6,
//               ),
//             ),
//             // const TimelineDivider(
//             //   axis: TimelineAxis.vertical,
//             //   begin: 0.1,
//             //   end: 0.9,
//             //   thickness: 6,
//             //   color: Colors.purple,
//             // ),
//             // TimelineTile(
//             //   axis: TimelineAxis.horizontal,
//             //   alignment: TimelineAlign.manual,
//             //   lineXY: 0.9,
//             //   beforeLineStyle: const LineStyle(
//             //     color: Colors.purple,
//             //     thickness: 6,
//             //   ),
//             //   afterLineStyle: const LineStyle(
//             //     color: Colors.deepOrange,
//             //     thickness: 6,
//             //   ),
//             //   indicatorStyle: const IndicatorStyle(
//             //     height: 20,
//             //     color: Colors.cyan,
//             //   ),
//             // ),
//             // const TimelineDivider(
//             //   axis: TimelineAxis.vertical,
//             //   begin: 0.1,
//             //   end: 0.9,
//             //   thickness: 6,
//             //   color: Colors.deepOrange,
//             // ),
//             // TimelineTile(
//             //   axis: TimelineAxis.horizontal,
//             //   alignment: TimelineAlign.manual,
//             //   lineXY: 0.1,
//             //   isLast: true,
//             //   beforeLineStyle: const LineStyle(
//             //     color: Colors.deepOrange,
//             //     thickness: 6,
//             //   ),
//             //   indicatorStyle: const IndicatorStyle(
//             //     height: 20,
//             //     color: Colors.red,
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
