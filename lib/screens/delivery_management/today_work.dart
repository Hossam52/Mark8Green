import 'package:driver_app/presentation/resourses/assets_manager.dart';
import 'package:driver_app/presentation/resourses/color_manager.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:driver_app/widgets/card_widget.dart';
import 'package:driver_app/widgets/custom_toggle_buttons.dart';
import 'package:driver_app/widgets/image_rounded.dart';
import 'package:driver_app/widgets/market_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodayWork extends StatelessWidget {
  const TodayWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _startWork(),
            _statistcs(),
            _paymentSystem(),
            _applyDiscount(),
            _specializedMarkets(),
          ],
        ),
      ),
    );
  }

  Widget _startWork() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Start work ',
              style: getRegularStyle(fontSize: 18),
            ),
            SizedBox(width: 8),
            _StartWorkToggelsActions()
          ],
        ),
        Divider()
      ],
    );
  }

  Widget _statistcs() {
    return Builder(builder: (context) {
      return Column(
        children: [
          Table(
            columnWidths: {
              0: FlexColumnWidth(1.5),
              1: FlexColumnWidth(2),
            },
            children: [
              _statisticItem(context, 'Max value per order', '50 J.D'),
              _statisticItem(context, 'Total weight per tour', '5'),
              _statisticItem(context, 'Max weight per tour', '50 KG'),
            ],
          ),
          Divider()
        ],
      );
    });
  }

  TableRow _statisticItem(BuildContext context, String title, String value) {
    return TableRow(children: [
      Text(
        title,
        style: getRegularStyle(fontSize: 18),
      ),
      Text(
        value,
        style: getRegularStyle(
            fontSize: 18, color: Theme.of(context).primaryColor),
      ),
    ]);
  }

  Widget _paymentSystem() {
    return Builder(builder: (context) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('Payment system', style: getRegularStyle(fontSize: 18)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(ImageAssets.cash),
                      SizedBox(width: 8),
                      Text(
                        'Cash',
                        style: getRegularStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider()
          ]);
    });
  }

  Widget _applyDiscount() {
    return Column(
      children: [
        Row(
          children: [
            Text('Apply discount', style: getRegularStyle(fontSize: 18)),
            SizedBox(width: 15.w),
            Container(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
                decoration: BoxDecoration(
                    color: ColorManager.lightGrey,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Text(
                  '70% discount',
                  style: getRegularStyle(
                    fontSize: 20,
                    color: ColorManager.white,
                  ),
                ))
          ],
        ),
        SizedBox(height: 5),
        Divider(),
      ],
    );
  }

  Widget _specializedMarkets() {
    return Builder(builder: (context) {
      final height = MediaQuery.of(context).size.height;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Specialized markets',
            style: getRegularStyle(fontSize: 18),
          ),
          SizedBox(
            height: height * 0.17,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (_, index) => MarketItem()),
          ),
          Divider(),
        ],
      );
    });
  }
}

class _StartWorkToggelsActions extends StatefulWidget {
  const _StartWorkToggelsActions({Key? key}) : super(key: key);

  @override
  __StartWorkToggelsActionsState createState() =>
      __StartWorkToggelsActionsState();
}

class __StartWorkToggelsActionsState extends State<_StartWorkToggelsActions> {
  @override
  void initState() {
    _workStatus = [
      ToggleItemData(
          title: 'Activeate',
          onPressed: () {
            changeSelectedIndex(0);
          }),
      ToggleItemData(
        title: 'Deactivate',
        onPressed: () {
          changeSelectedIndex(1);
        },
      ),
    ];
    super.initState();
  }

  void changeSelectedIndex(int index) {
    setState(() {
      _selectedWorkMissionIndex = index;
    });
  }

  late final _workStatus;
  int _selectedWorkMissionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomToggleButtons(
      tabs: _workStatus,
      selectedIndex: _selectedWorkMissionIndex,
    );
  }
}
