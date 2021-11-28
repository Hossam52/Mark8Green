import 'package:driver_app/general_commponent/default_button.dart';
import 'package:driver_app/presentation/resourses/color_manager.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: getRegularStyle(fontSize: 18, color: ColorManager.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildNotificationItem(context, 'Notification title',
                        'Notification body is well', '12:00 AM', '2021-10-31'),
                    _buildNotificationItem(context, 'Notification title',
                        'Notification body is well', '12:00 AM', '2021-10-31'),
                    _buildNotificationItem(context, 'Notification title',
                        'Notification body is well', '12:00 AM', '2021-10-31'),
                  ],
                ),
              ),
            ),
            DefaultButton(
                onPressed: () {},
                background: Theme.of(context).primaryColor,
                text: 'Delete all'),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(BuildContext context, String title, String body,
      String time, String date) {
    TextStyle style = getRegularStyle(color: Colors.white, fontSize: 15);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getBoldStyle(color: ColorManager.white, fontSize: 18)),
              Spacer(),
              Text(time, style: style),
            ],
          ),
          Text(body,
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: style),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(date, style: style),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
