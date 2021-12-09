import 'package:flutter/material.dart';
import 'package:fulanapp/size_config.dart';

// ignore: must_be_immutable
class CollectionWidget extends StatelessWidget {
  final String title;
  final VoidCallback? press;
  final String? id;
  final TextStyle? textStyle;
  bool isOpenned = false;

  CollectionWidget({
    Key? key,
    required this.title,
    this.press,
    this.id,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

   

    return Padding(
      padding: EdgeInsets.only(top: getProportionScreenWidth(24.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionScreenWidth(24.0)),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle ??
                        TextStyle(
                          fontSize: getProportionScreenWidth(24.0),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                SizedBox(width: getProportionScreenWidth(8.0)),
                GestureDetector(
                  onTap: press,
                  child: Row(
                    children: [
                      Text(
                        "Barchasi",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: getProportionScreenWidth(16.0),
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      // SvgPicture.asset(
                      //   'assets/icons/next_icon.svg',
                      //   width: getProportionScreenWidth(14.0),
                      //   height: getProportionScreenWidth(14.0),
                      //   color: Colors.red,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: getProportionScreenHeight(20.0)),
         
          
        ],
      ),
    );
  }
}
