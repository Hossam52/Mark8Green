import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:driver_app/general_commponent/components.dart';
import 'package:driver_app/presentation/resourses/assets_manager.dart';
import 'package:driver_app/presentation/resourses/color_manager.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:common_widgets/card_widget.dart';
import 'package:common_widgets/market_item.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CustomAppBar(
              id: '5224581729',
              title: 'Order details',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _invoiceData(),
                  _markets(),
                  _stores(),
                  _products(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _invoiceData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Invoice information', style: getRegularStyle(fontSize: 18)),
        SizedBox(height: 10.h),
        Center(
          child: Wrap(
            runSpacing: 14.h,
            spacing: 8.w,
            alignment: WrapAlignment.center,
            children: [
              _InvoiceItem('Total price', '60.30 JD'),
              _InvoiceItem('Total weight', '20 KG'),
              _InvoiceItem('Commission', '11 cent'),
              _InvoiceItem('Delivery time', '1:30 AM'),
              _InvoiceItem(
                'Payment method',
                'On recieving',
                valueIcon: buildIcon(ImageAssets.cash),
              ),
            ],
          ),
        ),
        Divider()
      ],
    );
  }

  Widget _markets() {
    return Builder(builder: (context) {
      final double height = MediaQuery.of(context).size.height;
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Markets count /2',
          style: getRegularStyle(fontSize: 18),
        ),
        SizedBox(
          height: height * 0.16,
          child: ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => MarketItem()),
        ),
        SizedBox(height: 5),
        Divider(),
      ]);
    });
  }

  Widget _stores() {
    return Builder(builder: (context) {
      final double height = MediaQuery.of(context).size.height;
      final double width = MediaQuery.of(context).size.width;
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Stores count /3',
          style: getRegularStyle(fontSize: 20),
        ),
        SizedBox(
          height: height * 0.16,
          child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => CardWidget(
                    imagePath: 'asset/images/macdonals.png',
                    width: width * 0.26,
                    title: 'Macdonals',
                  )),
        ),
        SizedBox(height: 5),
        Divider(),
      ]);
    });
  }

  Widget _products() {
    return Builder(builder: (context) {
      final double height = MediaQuery.of(context).size.height;
      final double width = MediaQuery.of(context).size.width;
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Products count /6',
          style: getRegularStyle(fontSize: 18),
        ),
        SizedBox(
          height: height * 0.21,
          child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => CardWidget(
                    imagePath: 'asset/images/burger.png',
                    title: 'Burger',
                    width: width * 0.31,
                    bottom: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('50 JD', style: getLightStyle(fontSize: 13)),
                        Text('50 JD', style: getLightStyle(fontSize: 13)),
                      ],
                    ),
                  )),
        ),
        SizedBox(height: 5),
        Divider(),
      ]);
    });
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key, required this.id, required this.title})
      : super(key: key);
  final double toggleHeight = 65;
  final String id;
  final String title;
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        title,
        style: getRegularStyle(fontSize: 18, color: Colors.white),
      ),
      centerTitle: true,
    );
    final appBarHeight = appBar.preferredSize.height;
    final height = appBarHeight + toggleHeight / 2;
    return Container(
      height: height,
      child: Stack(
        children: [
          SizedBox(height: appBarHeight, child: appBar),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: toggleHeight,
              child: Align(
                  alignment: Alignment.centerRight, child: _idContainer()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _idContainer() {
    final double buttonHeight = 30;
    return Builder(builder: (context) {
      return FittedBox(
        child: Container(
          decoration: BoxDecoration(
              color: ColorManager.buttonColor,
              borderRadius: BorderRadius.circular(6)),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width * 0.25,
          height: buttonHeight,
          child: Center(
            child: FittedBox(
              child: Text(
                id,
                style: getRegularStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _InvoiceItem extends StatelessWidget {
  const _InvoiceItem(this.headerTitle, this.headerValue,
      {Key? key, this.valueIcon})
      : super(key: key);
  final String headerTitle, headerValue;
  final Widget? valueIcon;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.29,
      height: height * 0.075,
      child: Column(
        children: [
          Expanded(child: _title()),
          Expanded(child: _value()),
        ],
      ),
    );
  }

  Widget _title() {
    return _container(headerTitle, ColorManager.buttonColor,
        textColor: Colors.white);
  }

  Widget _value() {
    return _container(headerValue, ColorManager.primaryLight, icon: valueIcon);
  }

  Widget _container(String display, Color color,
      {Color textColor = Colors.black, Widget? icon}) {
    return Builder(builder: (context) {
      return Container(
        padding: const EdgeInsets.all(3),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
        ),
        child: FittedBox(
          child: Center(
            child: Row(
              children: [
                Text(
                  display,
                  style: getRegularStyle(color: textColor),
                ),
                if (icon != null) SizedBox(width: 8),
                if (icon != null) icon
              ],
            ),
          ),
        ),
      );
    });
  }
}
