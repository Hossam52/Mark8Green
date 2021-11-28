import 'package:badges/badges.dart';
import 'package:driver_app/general_commponent/components.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:driver_app/screens/notifications/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationBadge extends StatelessWidget {
  const NotificationBadge({Key? key, required this.onPressed})
      : super(key: key);
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Badge(
          alignment: Alignment.topRight,
          badgeColor: Colors.red,
          badgeContent: Text(
            '1',
            style: getRegularStyle(color: Colors.white),
          ),
          position: BadgePosition(
            end: 5.w,
            top: -20.h,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            child: buildIcon('asset/images/notification.png',
                size: 30.r, color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
