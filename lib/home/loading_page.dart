import 'package:flutter/material.dart';
import '../size_config.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(.6),
      child: Center(
        child: Container(
          width: getProportionScreenWidth(90.0),
          height: getProportionScreenWidth(90.0),
          padding: EdgeInsets.all(getProportionScreenWidth(24.0)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: const CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
