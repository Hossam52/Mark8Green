import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:driver_app/widgets/image_rounded.dart';
import 'package:flutter/material.dart';

class MarketItem extends StatelessWidget {
  const MarketItem({Key? key}) : super(key: key);
  final title = 'Kahled';
  final distance = '3 KM';
  final imagePath = 'asset/images/kfc.png';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.28;
    return InkWell(
      onTap: () {},
      child: Container(
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: _data(),
        ),
      ),
    );
  }

  Card _data() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(6.0).copyWith(bottom: 10),
        child: Column(
          children: [
            Expanded(flex: 7, child: _image()),
            _title(),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: getRegularStyle(fontSize: 13),
        ),
        Text(
          distance,
          style: getLightStyle(fontSize: 12),
        )
      ],
    );
  }

  RoundedImage _image() {
    return RoundedImage(
        width: double.infinity, height: double.infinity, imagePath: imagePath);
  }
}
