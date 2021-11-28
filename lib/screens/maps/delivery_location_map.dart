import 'package:driver_app/general_commponent/components.dart';
import 'package:driver_app/general_commponent/default_button.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:driver_app/screens/maps/store_map_locations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryLocationMap extends StatelessWidget {
  const DeliveryLocationMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [_buildMap(), _specifyConfiguration()],
      ),
    ));
  }

  Widget _buildMap() {
    return Image.asset(
      'asset/images/maps.png',
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }

  Widget _chooseLocationCard() {
    return Align(
      alignment: Alignment.topCenter,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _pickerLocationCard(),
              Row(
                children: [
                  Expanded(
                    child: _listTile(true, Icons.home_outlined),
                  ),
                  Expanded(child: _listTile(false, Icons.my_location_sharp))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listTile(bool selected, IconData icon) {
    return Builder(builder: (context) {
      return Card(
        elevation: !selected ? 4 : 0,
        child: SizedBox(
          height: 50,
          child: ListTileTheme(
            minLeadingWidth: 0,
            textColor: Colors.black,
            selectedColor: Colors.white,
            child: ListTile(
              selected: selected,
              selectedTileColor: Theme.of(context).primaryColor,
              onTap: () {},
              focusColor: Colors.amber,
              // dense: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              leading: Icon(icon),
              title: Text('My address'),
            ),
          ),
        ),
      );
    });
  }

  Builder _pickerLocationCard() {
    return Builder(builder: (context) {
      return Row(
        children: [
          BackButton(
            color: Theme.of(context).primaryColor,
          ),
          Text('Choose picker location', style: getRegularStyle(fontSize: 18)),
        ],
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

  Widget _specifyConfiguration() {
    return Column(
      children: [
        _chooseLocationCard(),
        Spacer(),
        _locationString(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(builder: (context) {
            return DefaultButton(
              onPressed: () {
                To(context, StoreMapLocation());
              },
              text: 'Confirm location',
              toUpper: false,
            );
          }),
        )
      ],
    );
  }
}
