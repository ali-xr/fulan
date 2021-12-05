import 'package:flutter/material.dart';
import 'package:fulanapp/constants.dart';
import 'package:fulanapp/home/student_home_page.dart';
import 'package:fulanapp/size_config.dart';
import 'package:fulanapp/widgets/custom_app_bar.dart';

class StudentSignScreen extends StatefulWidget {
  @override
  State<StudentSignScreen> createState() => _StudentState();
}

class _StudentState extends State<StudentSignScreen> {
  final _formKey = GlobalKey<FormState>();

  String _jshshir = "";
  String _seria = "";
  String _oqish = "";
  String _motivation = "";

  bool _jshshirValidate = true;
  bool _seriaValidate = true;
  bool _oqishValidate = true;
  bool _motivationwordValidate = true;

  String _jshshirValidateText = "";
  String _seriaValidateText = "";
  String _oqishValidateText = "";
  String _motivationwordValidateText = "";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        cursorWidth: getProportionScreenWidth(1.0),
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.1,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromRGBO(247, 247, 247, 1),
                          hintText: "JSHSHIR PASSPORT",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.1,
                            fontSize: getProportionScreenWidth(20.0),
                            color: kTextColor.withOpacity(.4),
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          counterText: "",
                        ),
                        validator: (text) {
                          if (_jshshirValidate) {
                            return null;
                          }

                          return _jshshirValidateText;
                        },
                        onSaved: (text) {
                          _jshshir = text!;
                        },
                        onChanged: (text) {
                          setState(() {
                            _jshshirValidate = true;
                          });
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        cursorWidth: getProportionScreenWidth(1.0),
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.1,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromRGBO(247, 247, 247, 1),
                          hintText: "SERIA PASSPORT",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.1,
                            fontSize: getProportionScreenWidth(20.0),
                            color: kTextColor.withOpacity(.4),
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          counterText: "",
                        ),
                        validator: (text2) {
                          if (_oqishValidate) {
                            return null;
                          }

                          return _oqishValidateText;
                        },
                        onChanged: (text2) {
                          setState(() {
                            _oqishValidate = true;
                          });
                        },
                        onSaved: (text2) {
                          _oqish = text2!;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        cursorWidth: getProportionScreenWidth(1.0),
                        keyboardType: TextInputType.name,
                        obscureText: true,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.1,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromRGBO(247, 247, 247, 1),
                          hintText: "O'QISH JOYI",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: getProportionScreenWidth(20.0),
                            color: kTextColor.withOpacity(.4),
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (text1) {
                          if (_motivationwordValidate) {
                            return null;
                          }

                          return _motivationwordValidateText;
                        },
                        onChanged: (text1) {
                          setState(() {
                            _motivationwordValidate = true;
                          });
                        },
                        onSaved: (text1) {
                          _motivation = text1!;
                        },
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        maxLines: 3,
                        cursorWidth: getProportionScreenWidth(1.0),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.1,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromRGBO(247, 247, 247, 1),
                          hintText: "MOTIVATION",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.1,
                            fontSize: getProportionScreenWidth(20.0),
                            color: kTextColor.withOpacity(.4),
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          counterText: "",
                        ),
                        validator: (text1) {
                          if (_seriaValidate) {
                            return null;
                          }

                          return _seriaValidateText;
                        },
                        onSaved: (text1) {
                          _seria = text1!;
                        },
                        onChanged: (text1) {
                          setState(() {
                            _seriaValidate = true;
                          });
                        },
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: getProportionScreenHeight(40.0),
                            horizontal: getProportionScreenWidth(24.0),
                          ),
                          child: SizedBox(
                            height: getProportionScreenHeight(60.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                primary: const Color.fromRGBO(15, 15, 84, 1),
                              ),
                              child: Text(
                                "Kirish",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: getProportionScreenWidth(20.0),
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.1,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const StudentHome(),
                                  ),
                                  (Route<dynamic> route) => false,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
