import 'package:driver_app/general_commponent/components.dart';
import 'package:driver_app/general_commponent/default_button.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:driver_app/screens/maps/delivery_location_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreOwnerLocation extends StatelessWidget {
  const StoreOwnerLocation({Key? key}) : super(key: key);

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
              title: Text(
                'Alsalt Market',
                style: getRegularStyle(fontSize: 18),
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Store location',
                  style: getLightStyle(
                      fontSize: 18, color: Theme.of(context).primaryColor),
                ),
                _locationString(),
              ],
            ),
          ],
        );
      }),
    );
  }

  Widget _locationString() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Oman, Makka st 16511, Doar elsha3b, Wroker space, building 30/Office 10',
          style: getRegularStyle(fontSize: 18),
        ),
      ),
    );
  }
}
