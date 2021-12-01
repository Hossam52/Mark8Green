import 'package:driver_app/general_commponent/components.dart';
import 'package:driver_app/general_commponent/default_button.dart';
import 'package:driver_app/presentation/resourses/assets_manager.dart';
import 'package:driver_app/presentation/resourses/color_manager.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:driver_app/widgets/cancel_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettinsgScreen extends StatefulWidget {
  const SettinsgScreen({Key? key}) : super(key: key);

  @override
  State<SettinsgScreen> createState() => _SettinsgScreenState();
}

class _SettinsgScreenState extends State<SettinsgScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: getRegularStyle(fontSize: 22, color: ColorManager.white),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: _signout(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    _buildSettingItem(ImageAssets.language, 'Change language',
                        onPressed: _onChangeLangPressed),
                    _buildSettingItem(ImageAssets.files, 'Terms and conditions',
                        onPressed: () {}),
                    _buildSettingItem(ImageAssets.info, 'Who we are',
                        onPressed: () {}),
                    _buildSettingItem(ImageAssets.callUs, 'Call us',
                        onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _signout() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DefaultButton(
        iconEnd: true,
        icon: Image.asset(ImageAssets.logout),
        background: Theme.of(context).primaryColor,
        onPressed: () {},
        text: 'Sign out',
        radius: 15,
      ),
    );
  }

  Widget _buildSettingItem(String imagePath, String title,
      {required VoidCallback? onPressed, Widget? trailing}) {
    return ListTileTheme(
      contentPadding: const EdgeInsets.all(0),
      horizontalTitleGap: 0,
      // dense: true,
      child: Column(
        children: [
          ListTile(
            title: Text(title, style: getRegularStyle(fontSize: 18)),
            onTap: onPressed,
            leading: buildIcon(imagePath, size: 23.w),
            contentPadding: const EdgeInsets.all(0),
            trailing: trailing,
          ),
          divider(color: ColorManager.lightGrey),
        ],
      ),
    );
  }

  Future<void> _onChangeLangPressed() async {
    await showDialog(
        context: context,
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Dialog(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Choose language',
                          style: getRegularStyle(fontSize: 18),
                        ),
                        SizedBox(height: 20),
                        DefaultButton(
                          background: Theme.of(context).primaryColor,
                          onPressed: () {},
                          text: 'لغة عربية',
                        ),
                        SizedBox(height: 15),
                        DefaultButton(
                          background: Theme.of(context).primaryColor,
                          onPressed: () {},
                          text: 'English UK',
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    child: CancelItem(),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class CustomFlutterSwitch extends StatefulWidget {
  const CustomFlutterSwitch({Key? key}) : super(key: key);

  @override
  CustomFlutterSwitchState createState() => CustomFlutterSwitchState();
}

class CustomFlutterSwitchState extends State<CustomFlutterSwitch> {
  bool recieveNotifications = false;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
        padding: 2,
        height: 27,
        value: recieveNotifications,
        toggleSize: 20,
        inactiveToggleColor: Theme.of(context).colorScheme.primary,
        inactiveColor: Colors.white,
        switchBorder: Border.all(color: Colors.grey.withOpacity(0.4)),
        activeColor: Theme.of(context).colorScheme.primary,
        onToggle: (val) {
          setState(() {
            recieveNotifications = val;
          });
        });
  }
}
