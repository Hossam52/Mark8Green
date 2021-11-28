import 'package:flutter/material.dart';

class CustomRatingBars extends StatelessWidget {
  const CustomRatingBars(this.oneStar, this.twoStars, this.threeStars,
      this.fourStars, this.fiveStars,
      {Key? key, this.fillColor = Colors.amber})
      : super(key: key);
  final double oneStar, twoStars, threeStars, fourStars, fiveStars;
  final Color fillColor;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      _rowRatingBar(5, fiveStars),
      _rowRatingBar(4, fourStars),
      _rowRatingBar(3, threeStars),
      _rowRatingBar(2, twoStars),
      _rowRatingBar(1, oneStar),
    ]);
  }

  Widget _rowRatingBar(int starNumber, double value) {
    return Row(
      children: [
        Expanded(child: Container()),
        Text(starNumber.toString()),
        SizedBox(width: 10),
        Expanded(
          flex: 6,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Builder(builder: (context) {
              return Container(
                child: LinearProgressIndicator(
                  backgroundColor: Color(0xfff0f0f0),
                  color: fillColor,
                  value: value / 100,
                  minHeight: 8,
                ),
              );
            }),
          ),
        ),
        SizedBox(width: 10),
        Text('$value %'),
        Expanded(child: Container()),
      ],
    );
  }
}
