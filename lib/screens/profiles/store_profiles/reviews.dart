import 'package:driver_app/general_commponent/components.dart';
import 'package:driver_app/presentation/resourses/color_manager.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:driver_app/widgets/card_widget.dart';
import 'package:driver_app/widgets/custom_toggle_buttons.dart';
import 'package:driver_app/widgets/rating_bars.dart';
import 'package:driver_app/widgets/rating_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({Key? key}) : super(key: key);
  final double _rating = 4.5;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Rate Store',
                  style: getRegularStyle(color: ColorManager.lightGrey))),
          _starsAndRate(),
          _ratingBars(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Rate products',
                style: getRegularStyle(color: ColorManager.lightGrey)),
          ),
          SizedBox(
              width: (width * 0.45).w,
              child: FittedBox(child: ratingRow('', 'Bad 30%', 'Good 70%'))),
          SizedBox(
            height: height * 0.25,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _product(width),
                _product(width),
                _product(width),
                _product(width),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _product(double width) {
    return CardWidget(
        width: width / 3,
        imagePath: 'asset/images/shoes.png',
        title: 'Product name',
        bottom: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: FittedBox(
                child: Text('30% good',
                    style: getBoldStyle(fontSize: 16, color: Colors.green)),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: FittedBox(
                child: Text(
                  '70% bad',
                  style: getBoldStyle(fontSize: 16, color: Colors.red),
                ),
              ),
            )
          ],
        ));
  }

  Widget _ratingBars() {
    return CustomRatingBars(2, 7, 15, 40, 80);
  }

  Widget _starsAndRate() {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BackButton(
            color: Theme.of(context).primaryColor,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingRow(),
              SizedBox(width: 10),
              Text(
                '(49) review',
                style: getRegularStyle(fontSize: 18),
              ),
            ],
          ),
          Spacer()
        ],
      );
    });
  }
}
