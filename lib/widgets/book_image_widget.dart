import 'package:flutter/material.dart';
import 'package:fulanapp/size_config.dart';

class BookImageWidget extends StatelessWidget {
  final int? star;
  final String? imageUrl;
  final String? title;
  const BookImageWidget({
    Key? key,
    this.star,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            if (star != null)
              Positioned(
                top: getProportionScreenHeight(11),
                right: getProportionScreenWidth(0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 6.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.black,
                  ),
                  child: Row(
                    children: [
                      // SvgPicture.asset(
                      //   'assets/icons/star_fill_icon.svg',
                      //   width: 14.0,
                      //   height: 14.0,
                      // ),
                      SizedBox(
                        width: getProportionScreenWidth(4.0),
                      ),
                      Text(
                        star.toString(),
                        style: TextStyle(
                          fontSize: getProportionScreenWidth(16.0),
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        SizedBox(
          height: getProportionScreenHeight(28.0),
        ),
        // Kitob ismi uchun
        Text(
          title ?? 'Topilmadi',
          style: TextStyle(
            fontSize: getProportionScreenWidth(24.0),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
