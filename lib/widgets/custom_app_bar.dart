import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fulanapp/size_config.dart';
import 'package:fulanapp/variables/variables.dart';

class CustomAppBar extends StatelessWidget {
  final Widget child;
  final double? height;
  final Color? backgroundColor;

  const CustomAppBar({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Positioned(
      top: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15.0,
                sigmaY: 15.0,
              ),
              child: Container(
                color: backgroundColor ?? Colors.white.withOpacity(.7),
                height: height ?? 70.0,
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionScreenWidth(24.0),
                  vertical: getProportionScreenHeight(14.0),
                ),
                alignment: Alignment.bottomLeft,
                child: child,
              ),
            ),
          ),
          SizedBox(
            height: getProportionScreenHeight(10.0),
          ),
          ValueListenableBuilder<DownloadState>(
            valueListenable: Variables.downloadNotifier,
            builder:
                (BuildContext context, DownloadState value, Widget? child) {
              switch (value) {
                case DownloadState.downloading:
                  return builDownloadWidget(
                    const RotateIcon(),
                    "Yuklanmoqda",
                  );

                case DownloadState.downloaded:
                  // return builDownloadWidget(
                  //   SvgPicture.asset('assets/icons/check_icon.svg',
                  //     color: const Color(0xFF00B41D),
                  //     width: getProportionScreenWidth(18.0),
                  //     height: getProportionScreenWidth(18.0),
                  //   ),
                  //   "Fayl yuklandi",
                  // );

                case DownloadState.errorDownloading:
                  // return builDownloadWidget(
                  //   SvgPicture.asset('assets/icons/error_icon.svg',
                  //     color: const Color(0xFFFD4C45),
                  //     width: getProportionScreenWidth(18.0),
                  //     height: getProportionScreenWidth(18.0),
                  //   ),
                  //   "Yuklashda xatolik yuz berdi",
                  // );

                case DownloadState.notDonwloaded:
                  return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget builDownloadWidget(Widget icon, String title) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionScreenWidth(16.0),
        vertical: getProportionScreenHeight(14.0),
      ),
      margin: EdgeInsets.only(right: getProportionScreenWidth(24.0)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
      ),
      child: Row(
        children: [
          icon,
          SizedBox(width: getProportionScreenWidth(8.0)),
          Text(
            title,
            style: TextStyle(
              fontSize: getProportionScreenWidth(16.0),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class RotateIcon extends StatefulWidget {
  const RotateIcon({Key? key}) : super(key: key);

  @override
  _RotateIconState createState() => _RotateIconState();
}

class _RotateIconState extends State<RotateIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
      // child: SvgPicture.asset(
      //   'assets/icons/loading_icon.svg',
      //   color: Colors.black,
      //   width: getProportionScreenWidth(18.0),
      //   height: getProportionScreenWidth(18.0),
      // ),
    );
  }
}
