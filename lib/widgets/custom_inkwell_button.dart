import '../widgets/customfont.dart';
import '../constants.dart';
import 'package:flutter/material.dart';

class CustomInkwellButton extends StatelessWidget {
  final onTap;
  final double height;
  final double width;
  final double fontSize;
  final String buttonName;
  final Icon icon;
  FontWeight fontWeight;
  Color fontColor;
  Color bgColor;

  CustomInkwellButton({
    super.key,
    required this.onTap,
    required this.height,
    required this.width,
    this.fontSize = 1,
    this.buttonName = '',
    this.icon = const Icon(null),
    this.fontWeight = FontWeight.normal,
    this.fontColor = Colors.white,
    this.bgColor = FB_DARK_PRIMARY,

    });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor,
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        splashColor: FB_SECONDARY,
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Center(
            child: buttonName == ''
              ? icon
              : CustomFont(
                text: buttonName, 
              fontSize: fontSize,
               color: fontColor
               ),
          ),
        ),
      ),
    );
  }
}