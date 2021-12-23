import 'package:flutter/material.dart';
import 'package:driver_app/general_commponent/components.dart';
import 'package:driver_app/presentation/resourses/color_manager.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:driver_app/screens/maps/store_owner_location.dart';
// import 'package:driver_app/screens/profiles/store_profiles/store_profile_management.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_widgets/image_rounded.dart';

class StoreOwnerWidget extends StatelessWidget {
  const StoreOwnerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final greyStyle = TextStyle(color: Colors.grey);
    return InkWell(
      // onTap: () => To(
      //     context,
      //     StoreManagement(
      //       initialIndex: 1,
      //     )),
      child: Card(
        child: Row(
          children: [
            RoundedImage(
              imagePath: 'asset/images/store_owner.png',
              width: 80.w,
              height: 80.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Store owner',
                    style: getRegularStyle(color: ColorManager.lightGrey)),
                Text('محمد العلي', style: getSemiBoldStyle(fontSize: 20)),
                Text('115223',
                    style: getRegularStyle(color: ColorManager.lightGrey)),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Image.asset(
                  'asset/images/call.png',
                  width: 25.w,
                  height: 25.w,
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    To(context, StoreOwnerLocation());
                  },
                  child: Image.asset(
                    'asset/images/person_rounded.png',
                    width: 25.w,
                    height: 25.w,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
