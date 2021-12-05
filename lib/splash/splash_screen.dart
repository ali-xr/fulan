import 'package:flutter/material.dart';
import 'package:fulanapp/size_config.dart';

class SplashScreen extends StatelessWidget {
  final Widget? child;
  const SplashScreen({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    if (child != null) {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => child!),
          );
        },
      );
    }

    return Scaffold(
      // backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionScreenWidth(28.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              child: Image.asset(
                "assets/images/image_logo.png",
              ),
              height: getProportionScreenHeight(153.0),
              // width: getProportionScreenWidth(123.0),
            ),
            SizedBox(
              height: getProportionScreenHeight(30.0),
            ),
            SizedBox(
              child: Image.asset("assets/images/text_logo.png"),
              height: getProportionScreenHeight(107.13),
              width: getProportionScreenWidth(125.05),
            ),
            SizedBox(
              height: getProportionScreenHeight(22.0),
            ),
          ],
        ),
      ),
    );
  }
}
