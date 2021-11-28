import 'package:driver_app/screens/delivery_management/week_missions.dart';
import 'package:driver_app/screens/delivery_management/today_work.dart';
import 'package:driver_app/widgets/appbar_with_ToggleButtons.dart';
import 'package:driver_app/widgets/custom_toggle_buttons.dart';
import 'package:flutter/material.dart';

class DeliveryManagement extends StatefulWidget {
  DeliveryManagement({Key? key}) : super(key: key);

  @override
  State<DeliveryManagement> createState() => _DeliveryManagementState();
}

class _DeliveryManagementState extends State<DeliveryManagement> {
  late final List<ToggleItemDataWithWidget> _workMissionsToggles;
  @override
  void initState() {
    _workMissionsToggles = [
      ToggleItemDataWithWidget(
          title: 'Today work',
          onPressed: () {
            changeSelectedIndex(0);
          },
          page: TodayWork()),
      ToggleItemDataWithWidget(
          title: 'Week missions',
          onPressed: () {
            changeSelectedIndex(1);
          },
          page: WeekMissions()),
    ];
    super.initState();
  }

  void changeSelectedIndex(int index) {
    setState(() {
      _selectedWorkMissionIndex = index;
    });
  }

  int _selectedWorkMissionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _appBar(),
          Expanded(child: _workMissionsToggles[_selectedWorkMissionIndex].page)
        ],
      ),
    );
  }

  Widget _appBar() {
    return AppBarWithToggleButtons(
        toggleButtons: CustomToggleButtons(
      tabs: _workMissionsToggles,
      selectedIndex: _selectedWorkMissionIndex,
    ));
  }
}
