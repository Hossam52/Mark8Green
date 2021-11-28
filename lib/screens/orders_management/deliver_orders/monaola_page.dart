import 'dart:math';

import 'package:driver_app/general_commponent/colors.dart';
import 'package:driver_app/general_commponent/components.dart';
import 'package:driver_app/general_commponent/default_button.dart';
import 'package:driver_app/presentation/resourses/color_manager.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:driver_app/screens/orders_management/deliver_orders/delivery_page.dart';
import 'package:driver_app/widgets/card_widget.dart';
import 'package:driver_app/widgets/signature.dart';
import 'package:driver_app/widgets/store_owner_widget.dart';
import 'package:driver_app/widgets/table_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonaloaPage extends StatelessWidget {
  MonaloaPage({Key? key}) : super(key: key);

  final _recievingOrderRowsData = [
    TableRowItem(
        title: 'OID number',
        widget: Text('#5544123699', style: getRegularStyle())),
    TableRowItem(
        title: 'Discount',
        widget: Text('5 products', style: getRegularStyle())),
    TableRowItem(
        title: 'Order commision',
        widget: Text('1 JD', style: getRegularStyle())),
    TableRowItem(
        title: 'Total order price',
        widget: Text('94 JD', style: getRegularStyle())),
    TableRowItem(
        title: 'Payment method',
        widget: buildIcon('asset/images/cash.png', size: 30.r)),
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: height * 0.18, child: _remainToRecieve()),
          SizedBox(
            height: height * 0.14,
            child: _stores(context),
          ),
          _buyerIdetnifier(),
          SizedBox(height: 10),
          _confirmArrival(),
          Divider(),
          RecievingTableWidget(
              tableData: _recievingOrderRowsData, onPayInvoicePressed: () {})
        ],
      ),
    );
  }

  Widget _buyerIdetnifier() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Buyer identifier',
          style: getRegularStyle(),
        ),
        SizedBox(height: 8),
        StoreOwnerWidget(),
      ],
    );
  }

  Widget _remainToRecieve() {
    return Builder(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Remain to recieve',
                style: getRegularStyle(fontSize: 18),
                children: [
                  TextSpan(
                      text: '/ 2',
                      style: getRegularStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.primary))
                ],
              ),
            ),
            Expanded(
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (_, index) => _RemainForRecievingItem(
                      isSelected: Random.secure().nextBool(),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _stores(context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (_, index) => GestureDetector(
              onTap: () {},
              child: CardWidget(
                  width: MediaQuery.of(context).size.width * 0.24,
                  isSelected: Random.secure().nextBool(),
                  imagePath: 'asset/images/macdonals.png',
                  title: 'Macdonals',
                  bottom: Container()),
            ));
  }

  Widget _confirmArrival() {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reciever identifier',
            style: getRegularStyle(),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: 6,
                child: DefaultButton(
                    onPressed: () {}, text: 'Arrived', horizontalMargin: 0),
              ),
              Expanded(child: Container()),
              Flexible(
                flex: 9,
                child: Text('Meeting time 12:30 AM 15/9/2021',
                    style: getLightStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    )),
              )
            ],
          ),
        ],
      );
    });
  }
}

class _RemainForRecievingItem extends StatelessWidget {
  const _RemainForRecievingItem({Key? key, this.isSelected = false})
      : super(key: key);
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      constraints: BoxConstraints(minWidth: width / 4),
      padding: const EdgeInsets.all(5),
      color: isSelected ? selectedItemColor : null,
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: FittedBox(
                child: Text('55441123699', style: TextStyle(color: Colors.red)),
              ),
            ),
            Expanded(
                flex: 2,
                child: Image.asset(
                  'asset/images/black_bag.png',
                  color: Colors.red,
                )),
            SizedBox(height: 5),
            Expanded(
              child: FittedBox(
                  child: Text(
                '11:30AM',
                style: TextStyle(color: Colors.green),
              )),
            )
          ],
        ),
      ),
    );
  }
}
