import 'package:driver_app/presentation/resourses/color_manager.dart';
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
          dotColor: ColorManager.buttonColor,
          dotHeight: 12.h,
          dotWidth: 12.h),
      controller: pageController,
      count: count,
    );
  }
}
