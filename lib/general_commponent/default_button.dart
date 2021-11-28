import 'package:driver_app/presentation/resourses/color_manager.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class DefaultButton extends StatefulWidget {
  final Color? background;
  final Color textColor;
  final double? fontSize;
  final double? radius;
  final Widget? icon;
  final double? height;
  final bool isExpanded;
  final Function()? onPressed;
  final String text;
  final bool isBorder;
  final bool isShadow;
  final bool toUpper;
  final bool isFittedText;
  final bool iconEnd;
  final double horizontalMargin;
  final Color? disabledColor;

  DefaultButton(
      {required this.onPressed,
      required this.text,
      this.background,
      this.textColor = Colors.white,
      this.fontSize,
      this.radius,
      this.icon,
      this.height,
      this.isExpanded = true,
      this.isBorder = false,
      this.isFittedText = false,
      this.isShadow = true,
      this.toUpper = false,
      this.iconEnd = false,
      this.horizontalMargin = 21,
      this.disabledColor});

  @override
  _DefaultButtonState createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
      width: widget.isExpanded ? double.infinity : null,
      height: widget.height ?? MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
          color: widget.isBorder ? Colors.transparent : widget.background,
          borderRadius: BorderRadius.circular(
            widget.radius ?? 5,
          ),
          border: widget.isBorder
              ? Border.all(
                  color: widget.background ?? Theme.of(context).primaryColor)
              : null,
          boxShadow: widget.isShadow && !widget.isBorder
              ? [
                  BoxShadow(
                      color: Colors.black38,
                      offset: Offset(2, 2),
                      blurRadius: 2),
                ]
              : null),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => states.contains(MaterialState.disabled)
                      ? widget.disabledColor ?? Theme.of(context).disabledColor
                      : widget.isBorder
                          ? null
                          : widget.background),
            ),

        //  ButtonStyle(
        //   backgroundColor: MaterialStateProperty.resolveWith(
        //       (states) => states.contains(MaterialState.disabled)
        //           ? widget.disabledColor ?? Theme.of(context).disabledColor
        //           : widget.isBorder
        //               ? null
        //               : widget.background ?? Theme.of(context).primaryColor),
        //   // foregroundColor:
        //   //     MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
        //   padding: MaterialStateProperty.all(EdgeInsets.all(0)),
        //   overlayColor: MaterialStateProperty.resolveWith<Color>(
        //     (Set<MaterialState> states) {
        //       return Colors.white.withOpacity(0.20);
        //     },
        //   ),
        // ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Directionality(
            textDirection:
                widget.iconEnd ? TextDirection.ltr : TextDirection.rtl,
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.icon ?? Container(),
                  Spacer(),
                  widget.isFittedText
                      ? FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            widget.toUpper
                                ? widget.text.toUpperCase()
                                : widget.text,
                            textAlign: TextAlign.center,
                            style: getRegularStyle(
                              fontSize: widget.fontSize ?? 15,
                              color: widget.isBorder
                                  ? widget.background ??
                                      Theme.of(context).primaryColor
                                  : widget.textColor,
                            ),
                          ),
                        )
                      : Text(
                          widget.toUpper
                              ? widget.text.toUpperCase()
                              : widget.text,
                          textAlign: TextAlign.center,
                          style: getRegularStyle(
                            fontSize: widget.fontSize ?? 15,
                            color: widget.isBorder
                                ? widget.background ??
                                    Theme.of(context).primaryColor
                                : widget.textColor,
                          ),
                        ),
                  Spacer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
