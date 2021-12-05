// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fulanapp/size_config.dart';
// import 'package:fulanapp/variables/variables.dart';

// class CustomBottomNavigationBar extends StatefulWidget {
//   const CustomBottomNavigationBar({Key? key}) : super(key: key);

//   @override
//   State<CustomBottomNavigationBar> createState() =>
//       _CustomBottomNavigationBarState();
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   @override
//   void initState() {
//     super.initState();

//     Variables.bottomNavigationState = callback;
//   }

//   void callback() {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Container(
//       width: SizeConfig.screenWidth,
//       height: getProportionScreenHeight(85.0),
//       padding: EdgeInsets.symmetric(horizontal: getProportionScreenWidth(15.0)),
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.only(
//           topRight: Radius.circular(20.0),
//           topLeft: Radius.circular(20.0),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(.08),
//             offset: const Offset(0, -10),
//             blurRadius: 8.0,
//           ),
//         ],
//         color: Colors.white,
//       ),
//       child: Row(
//         children: [
//           _button(
//             icon: 'assets/icons/home_icon.svg',
//             changeIcon: 'assets/icons/home_fill_icon.svg',
//             index: 0,
//           ),
//           _button(
//             icon: 'assets/icons/search_icon.svg',
//             changeIcon: 'assets/icons/search_fill_icon.svg',
//             index: 1,
//           ),
//           _button(
//             icon: 'assets/icons/bookmark_icon.svg',
//             changeIcon: 'assets/icons/bookmark_fill_icon.svg',
//             index: 2,
//           ),
//           _button(
//             icon: 'assets/icons/profile_icon.svg',
//             changeIcon: 'assets/icons/person_fill_icon.svg',
//             index: 3,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _button({icon, index, changeIcon}) {
//     Widget? _profileWidget;

//     _profileWidget = ValueListenableBuilder<int>(
//       valueListenable: Variables.currentScreenIndexNotifier,
//       builder: (BuildContext context, int screenIndex, Widget? child) {
//         return Align(
//           alignment: Alignment.center,
//           child: SizedBox(
//             width: getProportionScreenWidth(28.0),
//             height: getProportionScreenWidth(28.0),
//             child: SvgPicture.asset(
//               index == screenIndex ? changeIcon : icon,
//               color: index == screenIndex ? Colors.black : Colors.grey,
//             ),
//           ),
//         );
//       },
//     );

//     if (Variables.profileData != null) {
//       if (Variables.profileData!.userPhoto != null && index == 3) {
//         _profileWidget = ValueListenableBuilder(
//           valueListenable: Variables.currentScreenIndexNotifier,
//           builder: (BuildContext context, int screenIndex, Widget? child) {
//             return CachedNetworkImage(
//               imageUrl: Variables.profileData!.userPhoto ?? '',
//               imageBuilder: (context, imageProvider) => Container(
//                 width: getProportionScreenWidth(38.0),
//                 height: getProportionScreenWidth(38.0),
//                 padding: EdgeInsets.all(getProportionScreenWidth(2.0)),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: index == screenIndex
//                         ? Colors.black
//                         : Colors.transparent,
//                   ),
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                       image: imageProvider,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               errorWidget: (context, error, imageProvider) => Container(
//                 width: getProportionScreenWidth(38.0),
//                 height: getProportionScreenWidth(38.0),
//                 padding: EdgeInsets.all(getProportionScreenWidth(2.0)),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: index == screenIndex
//                         ? Colors.black
//                         : Colors.transparent,
//                   ),
//                 ),
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     color: Colors.black,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//               placeholder: (context, imageProvider) => Container(
//                 width: getProportionScreenWidth(38.0),
//                 height: getProportionScreenWidth(38.0),
//                 padding: EdgeInsets.all(getProportionScreenWidth(2.0)),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: index == screenIndex
//                         ? Colors.black
//                         : Colors.transparent,
//                   ),
//                 ),
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     color: Colors.black,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       }
//     }

//     return Expanded(
//       child: InkWell(
//         splashColor: Colors.transparent,
//         focusColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         onTap: () {
//           Variables.currentScreenIndexNotifier.value = index;
//         },
//         child: _profileWidget,
//       ),
//     );
//   }
// }
