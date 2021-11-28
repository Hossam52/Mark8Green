import 'package:driver_app/general_commponent/components.dart';
import 'package:driver_app/general_commponent/default_button.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:driver_app/screens/maps/address_location.dart';
import 'package:driver_app/widgets/cover_and_profile_image.dart';
import 'package:driver_app/widgets/custom_toggle_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPersonalProfile extends StatelessWidget {
  const EditPersonalProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit profile',
          style: getRegularStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // _coverImage(),
            SizedBox(height: 20),
            _inputs(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultButton(
                onPressed: () {},
                text: 'Save Changes',
              ),
            )
          ],
        ),
      ),
    );
  }

  CoverProfileImage _coverImage() {
    return CoverProfileImage(
        totalHeight: 200.h,
        radius: 60.r,
        endWidget: Directionality(
          textDirection: TextDirection.rtl,
          child: TextButton.icon(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {},
              icon: Image.asset(
                'asset/images/edit.png',
                scale: 1.3,
              ),
              label: Text('Modify')),
        ),
        changeProfilePictures: true,
        coverImagePath: 'asset/images/coverProfile.png',
        profileImagePath: 'asset/images/userProfile.png');
  }

  Widget _inputs() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _changeName(),
          buildRow(
              title: 'Age',
              value: defaultTextForm(TextEditingController(), '30')),
          buildRow(
              title: 'Change phone',
              value: defaultTextForm(TextEditingController(), '0780997333')),
          buildRow(title: 'Gender', value: _genderSelection()),
          buildRow(
              title: 'Current password',
              value: defaultTextForm(TextEditingController(), '**********',
                  isPassword: true)),
          buildRow(
              title: 'Change password',
              value: defaultTextForm(TextEditingController(), '**********',
                  isPassword: true)),
          buildRow(
              title: 'Nationality',
              value: defaultTextForm(TextEditingController(), 'Jordan')),
          _changeAddress(),
          buildRow(
              title: 'Locate home address over map',
              value: _locateAddress(),
              titleSpace: 3),
        ],
      ),
    );
  }

  Widget _locateAddress() {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GestureDetector(
              onTap: () {
                To(context, AddressLocation());
              },
              child: buildIcon('asset/images/map.png', size: 30.w),
            ),
          )
        ],
      );
    });
  }

  Widget _changeAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Change address and home location',
          style: getRegularStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        defaultTextForm(TextEditingController(), 'Type your address location',
            maxLines: 4),
        SizedBox(height: 10),
        Divider(),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _genderSelection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          CustomToggleButtons(tabs: [
            ToggleItemData(title: 'Male', onPressed: () {}),
            ToggleItemData(title: 'Female', onPressed: () {}),
          ]),
        ],
      ),
    );
  }

  Widget _changeName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Change name',
          style: getRegularStyle(fontSize: 18),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
                child: defaultTextForm(TextEditingController(), 'Mohamed')),
            Expanded(
              child: defaultTextForm(TextEditingController(), 'Ahmed'),
            ),
          ],
        ),
        SizedBox(height: 8),
        Divider(),
        SizedBox(height: 8),
      ],
    );
  }
}
