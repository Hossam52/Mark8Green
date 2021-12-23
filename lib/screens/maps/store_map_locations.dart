import 'package:flutter/material.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';

class StoreMapLocation extends StatelessWidget {
  const StoreMapLocation({Key? key}) : super(key: key);

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
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppBar(
              title: Text(
                'Store location',
                style: getSemiBoldStyle(
                    fontSize: 20, color: Theme.of(context).primaryColor),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            ),
            _locationString()
          ],
        ),
      );
    });
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
