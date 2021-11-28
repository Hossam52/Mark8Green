import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget(
      {Key? key, required this.pageController, required this.count})
      : super(key: key);
  final PageController pageController;
  final int count;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      effect: WormEffect(
          activeDotColor: Theme.of(context).primaryColor,
          dotHeight: 15.h,
          dotWidth: 15.h),
      controller: pageController,
      count: count,
    );
  }
}
