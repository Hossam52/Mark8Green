import 'dart:math';

import 'package:driver_app/presentation/resourses/color_manager.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:flutter/material.dart';

class OrdersViewList extends StatelessWidget {
  const OrdersViewList({Key? key, required this.items, this.itemHeight})
      : super(key: key);
  final List items;
  final double? itemHeight;
  @override
  Widget build(BuildContext context) {
    final height = itemHeight ?? MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.11,
      child: Card(
        child: Container(
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (_, index) => VerticalDivider(
                    width: 0.5,
                  ),
              itemBuilder: (_, index) => _OrderItem(
                    isSelected: Random.secure().nextBool(),
                  )),
        ),
      ),
    );
  }
}

class _OrderItem extends StatelessWidget {
  const _OrderItem({Key? key, this.isSelected = false}) : super(key: key);
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      constraints: BoxConstraints(maxWidth: width * 0.24),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: FittedBox(
                child:
                    Text('55441123699', style: getRegularStyle(fontSize: 11)),
              ),
            ),
            Expanded(
                flex: 2,
                child: Image.asset(
                  'asset/images/order_cube.png',
                )),
            SizedBox(height: 5),
            Expanded(
              child: Container(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : ColorManager.buttonColor,
                child: FittedBox(
                  child: Text(
                    '12:30 AM',
                    style: getRegularStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
