import 'package:driver_app/general_commponent/colors.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:driver_app/widgets/cancel_Item.dart';
import 'package:driver_app/widgets/image_rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardWidget extends StatelessWidget {
  CardWidget(
      {Key? key,
      this.isSelected,
      required this.imagePath,
      required this.title,
      this.bottom,
      this.delelteItemCallBack,
      this.width})
      : super(key: key);
  final bool? isSelected;
  final String imagePath;
  final String title;
  final Widget? bottom;
  final VoidCallback? delelteItemCallBack;
  late double? width;

  @override
  Widget build(BuildContext context) {
    if (width == null) width = (MediaQuery.of(context).size.width / 2.95).w;
    return Container(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Stack(
          children: [
            _data(),
            if (delelteItemCallBack != null)
              GestureDetector(
                onTap: delelteItemCallBack,
                child: CancelItem(),
              )
          ],
        ),
      ),
    );
  }

  Card _data() {
    return Card(
      elevation: isSelected != null ? 0 : 4,
      color: isSelected != null && isSelected! ? selectedItemColor : null,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Expanded(flex: 7, child: _image()),
            // Expanded(
            //   flex: 3,
            // child:
            _title(),
            // ),
            if (bottom != null) bottom!
          ],
        ),
      ),
    );
  }

  Text _title() {
    return Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: getRegularStyle(fontSize: 13),
    );
  }

  RoundedImage _image() {
    return RoundedImage(
        width: double.infinity, height: double.infinity, imagePath: imagePath);
  }
}
