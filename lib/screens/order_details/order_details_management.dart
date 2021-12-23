import 'package:common_widgets/build_icon.dart';
import 'package:common_widgets/profile.dart';
import 'package:common_widgets/table_data_widget.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:driver_app/screens/maps/shopper_delivery_location.dart';
import 'package:driver_app/screens/order_details/order_details_screen.dart';
import 'package:common_widgets/default_button.dart';
import 'package:common_widgets/indicator_widget.dart';

class OrderDetailsManagement extends StatelessWidget {
  OrderDetailsManagement({Key? key}) : super(key: key);
  final List<Widget> _pages = [
    ProfileStructure(
      profileData: ProfileDataConfigs(
          imagePath: 'asset/images/userProfile.png',
          coverImagePath: 'asset/images/coverProfile.png',
          showDiscription: false,
          profileId: '5544123695',
          title: 'Shopper details',
          tableTitleSizeFactor: 2,
          tableValueSizeFactor: 5,
          detailsTable: _shopperDetails),
    ),
    OrderDetailsScreen(),
    ShopperDeliveryLocation()
  ];
  static List<TableRowItem> get _shopperDetails {
    return [
      TableRowItem(title: 'Name', widget: Text('Hossam Hassan')),
      TableRowItem(title: 'ID', widget: Text('325')),
      TableRowItem(title: 'Age', widget: Text('22')),
      TableRowItem(title: 'Gender', widget: Text('Male')),
      TableRowItem(title: 'Nationality', widget: _buildNationality()),
    ];
  }

  static Widget _buildNationality() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Jordan",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: getRegularStyle(
                  fontSize: 18,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
          ),
          BuildIcon(path: "asset/images/jordan.png", size: 25),
        ],
      ),
    );
  }

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
                  activeColor: Theme.of(context).primaryColor,
                  pageController: _pagesController,
                  count: _pages.length),
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
