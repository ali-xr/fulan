import 'package:flutter/material.dart';
import 'package:fulanapp/size_config.dart';
import 'package:fulanapp/variables/variables.dart';

class AppScreen extends StatelessWidget {
  AppScreen({Key? key}) : super(key: key);

  final List<Widget> _screens = [
    // home screen
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            ValueListenableBuilder<int>(
              valueListenable: Variables.currentScreenIndexNotifier,
              builder: (BuildContext context, int index, Widget? child) {
                return _screens[index];
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Column(
                children: const [
                  // CustomBottomNavigationBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
