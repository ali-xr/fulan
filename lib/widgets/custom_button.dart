import 'package:flutter/material.dart';
import 'package:fulanapp/size_config.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  VoidCallback? press;
  final dynamic icon;
  double? size;
  Color? color;

  CustomButton({
    Key? key,
    this.press,
    required this.icon,
    this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(getProportionScreenWidth(8.0)),
        child: 
        // icon is String
            // ? Icon(
            //     icon,
            //     semanticsLabel: 'Acme Logo',
            //     width: getProportionScreenWidth(size ?? 26.0),
            //     height: getProportionScreenWidth(size ?? 26.0),
            //     color: color ?? Colors.black,
            //   )
            // : 
            Icon(
                icon,
                size: getProportionScreenWidth(size ?? 28.0),
                color: color,
              ),
      ),
    );
  }
}
