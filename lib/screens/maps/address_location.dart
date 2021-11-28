import 'package:driver_app/general_commponent/components.dart';
import 'package:driver_app/general_commponent/default_button.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:driver_app/screens/maps/delivery_location_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressLocation extends StatelessWidget {
  const AddressLocation({Key? key}) : super(key: key);

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
          AppBar(
            title: Text(
              'Change Address Location',
              style: getRegularStyle(fontSize: 18, color: Colors.white),
            ),
            centerTitle: true,
          ),
          _locationString(),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(builder: (context) {
              return DefaultButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Save',
                toUpper: false,
              );
            }),
          )
        ],
      );
    });
  }
}

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

class DisplayCurrentLocation extends StatelessWidget {
  const DisplayCurrentLocation({Key? key}) : super(key: key);

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
          _appBar(context, 'Address location'),
          _locationString(),
          Spacer(),
        ],
      );
    });
  }
}
