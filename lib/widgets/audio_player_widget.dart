// import 'dart:ui';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:tingla/constants.dart';
// import 'package:tingla/screens/audio/audio_player_screen.dart';
// import 'package:tingla/size_config.dart';
// import 'package:tingla/variables/audio_player_manager.dart';
// import 'package:tingla/variables/variables.dart';

// import 'custom_button.dart';

// class AudioPlayerWidget extends StatefulWidget {
//   const AudioPlayerWidget({Key? key}) : super(key: key);

//   @override
//   _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
// }

// class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: AudioController.isLocalNotifier,
//       builder: (_, bool isLocal, __) {
//         return Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: getProportionScreenWidth(24.0),
//             vertical: getProportionScreenHeight(20.0),
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(8.0),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(
//                 sigmaX: 50.0,
//                 sigmaY: 50.0,
//               ),
//               child: Container(
//                 width: SizeConfig.screenWidth! - getProportionScreenWidth(48.0),
//                 padding: EdgeInsets.symmetric(
//                   vertical: getProportionScreenWidth(14.0),
//                   horizontal: getProportionScreenWidth(20.0),
//                 ),
//                 decoration: const BoxDecoration(
//                   color: Color.fromRGBO(215, 215, 215, 0.7),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: InkWell(
//                         onTap: () {
//                           AudioController.isAudioPlayer = true;
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => AudioPlayerScreen(
//                                 isLocal: isLocal,
//                               ),
//                             ),
//                           );
//                         },
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               isLocal
//                                   ? AudioController.localBook != null
//                                       ? AudioController.localBook!.title!
//                                       : 'Topilmadi'
//                                   : AudioController.book != null
//                                       ? AudioController.book!.data!.title!
//                                       : 'Topilmadi',
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 1,
//                               style: TextStyle(
//                                 fontSize: getProportionScreenWidth(16.0),
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 4.0,
//                             ),
//                             Text(
//                               isLocal
//                                   ? AudioController.localBook != null
//                                       ? AudioController.localBook!.description!
//                                       : 'Topilmadi'
//                                   : AudioController.book != null
//                                       ? AudioController.book!.data!.description!
//                                       : 'Topilmadi',
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 1,
//                               style: TextStyle(
//                                 color: kTextColor.withOpacity(.6),
//                                 fontSize: getProportionScreenWidth(14.0),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: getProportionScreenWidth(13.0),
//                     ),
//                     Row(
//                       children: [
//                         CustomButton(
//                           icon: 'assets/icons/audio_back_icon.svg',
//                           color: Colors.black,
//                           size: getProportionScreenWidth(22.0),
//                           press: () {
//                             Variables.audioPlayer!.back();
//                           },
//                         ),
//                         ValueListenableBuilder<bool>(
//                           valueListenable:
//                               Variables.audioPlayer!.isPlayingNotifier,
//                           builder: (_, value, __) {
//                             return GestureDetector(
//                               onTap: () async {
//                                 if (isLocal) {
//                                   Variables.audioPlayer!.playInLocal();
//                                 } else {
//                                   Variables.audioPlayer!.playInNetwork();
//                                 }
//                               },
//                               child: Container(
//                                 width: getProportionScreenWidth(45.0),
//                                 alignment: Alignment.center,
//                                 padding: EdgeInsets.only(
//                                     left: getProportionScreenWidth(
//                                         value ? 0.0 : 8.0)),
//                                 child: value
//                                     ? Icon(
//                                         CupertinoIcons.pause_fill,
//                                         color: Colors.black,
//                                         size: getProportionScreenWidth(24.0),
//                                       )
//                                     : Icon(
//                                         CupertinoIcons.play_fill,
//                                         color: Colors.black,
//                                         size: getProportionScreenWidth(24.0),
//                                       ),
//                               ),
//                             );
//                           },
//                         ),
//                         CustomButton(
//                           icon: 'assets/icons/audio_next_icon.svg',
//                           color: Colors.black,
//                           size: getProportionScreenWidth(22.0),
//                           press: () {
//                             Variables.audioPlayer!.next();
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
