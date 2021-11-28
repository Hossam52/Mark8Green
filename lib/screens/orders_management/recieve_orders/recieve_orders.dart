import 'dart:math';

import 'package:driver_app/general_commponent/colors.dart';
import 'package:driver_app/general_commponent/default_button.dart';
import 'package:driver_app/presentation/resourses/color_manager.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:driver_app/widgets/border_container_light.dart';
import 'package:driver_app/widgets/card_widget.dart';
import 'package:driver_app/widgets/custom_stepper.dart';
import 'package:driver_app/widgets/custom_toggle_buttons.dart';
import 'package:driver_app/widgets/image_rounded.dart';
import 'package:driver_app/widgets/orders_view.dart';
import 'package:driver_app/widgets/store_owner_widget.dart';
import 'package:driver_app/widgets/table_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelines/timelines.dart';

class RecieveOrders extends StatefulWidget {
  RecieveOrders({Key? key}) : super(key: key);

  @override
  State<RecieveOrders> createState() => _RecieveOrdersState();
}

class _RecieveOrdersState extends State<RecieveOrders> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _chooseOrders(height),
          _shopperIdentityColumn(),
          _fillTour(),
          _tourInfo(),
          _startTourButton()
        ],
      ),
    );
  }

  Widget _chooseOrders(double height) {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Choose orders', style: getRegularStyle()),
          OrdersViewList(items: List.generate(5, (index) => 1)),
          Divider()
        ],
      );
    });
  }

  Column _shopperIdentityColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shopper identity', style: getRegularStyle()),
        _ShopperIdentity(),
        Divider(),
      ],
    );
  }

  Widget _fillTour() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Fill tour', style: getRegularStyle()),
        OrdersViewList(items: List.generate(3, (index) => 1)),
        Divider(),
      ],
    );
  }

  Widget _tourInfo() {
    final rows = [
      TableRowItem(title: 'Tour number', widget: Text('2')),
      TableRowItem(title: 'Orders number', widget: Text('2/5')),
      TableRowItem(title: 'Payload weight', widget: Text('15/30')),
    ];
    return TableDataWidget(rows: rows);
  }

  Widget _startTourButton() {
    return DefaultButton(onPressed: () {}, text: 'Start tour');
  }
}

class _ShopperIdentity extends StatelessWidget {
  const _ShopperIdentity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(children: [
          Expanded(
              child: RoundedImage(
                  height: MediaQuery.of(context).size.height * 0.07,
                  imagePath: 'asset/images/store_owner.png')),
          SizedBox(width: 10),
          Expanded(
              flex: 3,
              child: Text('Mohamed Hassan  134',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getRegularStyle())),
          Expanded(
            flex: 3,
            child: DefaultButton(
              horizontalMargin: 10,
              onPressed: () {},
              text: 'Order details',
              background: Theme.of(context).primaryColor,
            ),
          )
        ]),
      ),
    );
  }
}
