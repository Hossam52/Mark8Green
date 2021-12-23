import 'package:flutter/material.dart';

import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:driver_app/general_commponent/components.dart';
import 'package:driver_app/screens/order_details/order_details_management.dart';
import 'package:common_widgets/orders_view.dart';
import 'package:common_widgets/table_data_widget.dart';
import 'package:common_widgets/default_button.dart';
import 'package:common_widgets/image_rounded.dart';

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
              onPressed: () {
                To(context, OrderDetailsManagement());
              },
              text: 'Order details',
              background: Theme.of(context).primaryColor,
            ),
          )
        ]),
      ),
    );
  }
}
