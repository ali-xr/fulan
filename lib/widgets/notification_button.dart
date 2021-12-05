import 'package:flutter/material.dart';
import 'package:fulanapp/size_config.dart';

// ignore: must_be_immutable
class NotificationButton extends StatelessWidget {
  NotificationButton(
      {Key? key, this.notification, this.press, required this.icon})
      : super(key: key);
  var notification;
  final press;
  final icon;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    notification = notification ?? 0;
    return InkWell(
      onTap: press,
      child: SizedBox(
        width: getProportionScreenWidth(33.0),
        height: getProportionScreenHeight(39.0),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                width: getProportionScreenWidth(28.0),
                height: getProportionScreenWidth(28.0),
                // child: SvgPicture.asset(icon),
              ),
            ),
            notification != 0
                ? Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: getProportionScreenWidth(18.0),
                      height: getProportionScreenHeight(18.0),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        notification.toString(),
                        style: TextStyle(
                          fontSize: getProportionScreenWidth(12.0),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
