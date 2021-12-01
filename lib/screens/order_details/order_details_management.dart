import 'package:driver_app/general_commponent/default_button.dart';
import 'package:driver_app/screens/maps/shopper_delivery_location.dart';
import 'package:driver_app/screens/order_details/order_details_screen.dart';
import 'package:driver_app/screens/profiles/personal/profile_screen.dart';
import 'package:driver_app/widgets/indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsManagement extends StatelessWidget {
  OrderDetailsManagement({Key? key}) : super(key: key);
  final List<Widget> _pages = [
    ProfileScreen(),
    OrderDetailsScreen(),
    ShopperDeliveryLocation()
  ];
  final PageController _pagesController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pagesController,
                scrollDirection: Axis.horizontal,
                children: _pages,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IndicatorWidget(
                  pageController: _pagesController, count: _pages.length),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.h),
              child: DefaultButton(onPressed: () {}, text: 'Want to deliver ?'),
            ),
          ],
        ),
      ),
    );
  }
}
