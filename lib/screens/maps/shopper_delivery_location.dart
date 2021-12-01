import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:flutter/material.dart';

AppBar _appBar(BuildContext context, String title,
    {Color backgroundColor = Colors.transparent}) {
  return AppBar(
    elevation: 0,
    backgroundColor: backgroundColor,
    iconTheme: IconThemeData(color: Colors.black),
    title: Text(
      title,
      style: getBoldStyle(fontSize: 20, color: Theme.of(context).primaryColor),
    ),
    centerTitle: true,
  );
}

Widget _locationString() {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Oman, Makka st 16511, Doar elsha3b, Wroker space, building 30/Office 10',
        style: getRegularStyle(fontSize: 18),
      ),
    ),
  );
}

class ShopperDeliveryLocation extends StatelessWidget {
  const ShopperDeliveryLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [_buildMap(), _data()],
        ),
      ),
    );
  }

  Widget _buildMap() {
    return Image.asset(
      'asset/images/maps.png',
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }

  Widget _data() {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _appBar(context, 'Delivery address location'),
          _locationString(),
          Spacer(),
        ],
      );
    });
  }
}
