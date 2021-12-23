import 'package:flutter/material.dart';
import 'package:driver_app/models/review_model.dart';
import 'package:driver_app/screens/profiles/driver_profile/driver_reviews.dart';
// import 'package:driver_app/widgets/morag3at.dart';
// import 'package:driver_app/widgets/custom_toggle_buttons.dart';
import 'package:common_widgets/morag3at.dart';
import 'package:common_widgets/custom_toggle_buttons.dart';
import 'package:common_widgets/morag3at_model.dart';

class DriverReviewsManagement extends StatefulWidget {
  const DriverReviewsManagement(
      {Key? key, required this.driverReviewModel, required this.morag3atModel})
      : super(key: key);
  final DriverReviewModel driverReviewModel;
  final List<Morag3atModel> morag3atModel;
  @override
  State<DriverReviewsManagement> createState() =>
      _DriverReviewsManagementState();
}

class _DriverReviewsManagementState extends State<DriverReviewsManagement> {
  @override
  void initState() {
    _reviewsTabs = [
      ToggleItemDataWithWidget(
          title: 'Reviews',
          onPressed: () => onChangeSelected(0),
          page: DriverReviews(
            driverReviewModel: widget.driverReviewModel,
          )),
      ToggleItemDataWithWidget(
          title: 'Morag3at',
          onPressed: () => onChangeSelected(1),
          page: Morag3atWidget(morg3at: widget.morag3atModel)),
    ];
    super.initState();
  }

  late List<ToggleItemDataWithWidget> _reviewsTabs;

  int _selectedTabIndex = 0;

  void onChangeSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Text('Hello man')
          _toggleButtons(),
          Expanded(child: _reviewsTabs[_selectedTabIndex].page)
        ],
      ),
    );
  }

  Widget _toggleButtons() {
    return CustomToggleButtons(
        tabs: _reviewsTabs, selectedIndex: _selectedTabIndex);
  }
}
