import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fulanapp/auth/singup_screen.dart';
import 'package:fulanapp/auth/registor.dart';
import 'package:fulanapp/size_config.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:fulanapp/variables/variables.dart';
import 'package:fulanapp/widgets/custom_app_bar.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class CheckPhoneNumberScreen extends StatefulWidget {
  const CheckPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  _CheckPhoneNumberScreenState createState() => _CheckPhoneNumberScreenState();
}

class _CheckPhoneNumberScreenState extends State<CheckPhoneNumberScreen> {
  final _formKey = GlobalKey<FormState>();
  String _phone = "";
  String _pass = "";
  bool _isTapped = false;

  bool _phoneValidate = true;
  bool _passValidate = true;

  String _phoneValidateText = "";
  String _passValidateText = "";

  bool isLoading = false;

  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    PhoneInputFormatter.replacePhoneMask(
      countryCode: 'UZ',
      newMask: '+000 00 000-00-00',
    );

    _textEditingController.addListener(() {
      if (_textEditingController.text.length < 4) {
        _textEditingController.text = '+998';

        _textEditingController.selection =
            const TextSelection(baseOffset: 4, extentOffset: 4);
      }
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionScreenWidth(24.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: getProportionScreenHeight(160.0)),
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _textEditingController,
                            cursorWidth: getProportionScreenWidth(1.0),
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              PhoneInputFormatter(),
                            ],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.1,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(247, 247, 247, 1),
                              hintText: "Telefon raqamingiz",
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
                              if (_phoneValidate) {
                                return null;
                              }

                              return _phoneValidateText;
                            },
                            onChanged: (text) {
                              setState(() {
                                _phoneValidate = true;
                              });
                            },
                            onSaved: (text) {
                              _phone = text!;
                            },
                            onTap: () {
                              if (!_isTapped) {
                                _textEditingController.text = '+998';
                                _isTapped = true;
                              }
                            },
                          ),
                          SizedBox(height: getProportionScreenHeight(60.0)),
                          TextFormField(
                            controller: _passwordEditingController,
                            cursorWidth: getProportionScreenWidth(1.0),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.1,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(247, 247, 247, 1),
                              hintText: "Password raqamingiz",
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
                              if (_passValidate) {
                                return null;
                              }

                              return _passValidateText;
                            },
                            onChanged: (text1) {
                              setState(() {
                                _passValidate = true;
                              });
                            },
                            onSaved: (text1) {
                              _pass = text1!;
                            },
                            onTap: () {
                              if (!_isTapped) {
                                _isTapped = true;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                InputNameScreen(phoneNumber: _phone),
                          ),
                        );
                      },
                      child: const Text(
                        "Ro'yxatdan o'tish uchun bu qismni bosing!",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            CustomAppBar(
              child: Text(
                "Kirish",
                style: TextStyle(
                  color: kTextColor,
                  fontSize: getProportionScreenWidth(28.0),
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.1,
                ),
              ),
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
                      _checkValidate();
                      if (_formKey.currentState!.validate()) {
                        singIn(_phone, _pass);
                      } else {}
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future singIn(number, password) async {
    setState(() {
      isLoading = true;
    });
    print(number);
    http.Response response = await http.post(
      Uri.parse("https://fulan-back.herokuapp.com/users/login"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode({
        'phone': _splitFormatter(number),
        'password': password,
      }),
    );

    setState(() {
      isLoading = false;
    });

    print(response.statusCode);
    if (response.statusCode == 200) {
      Variables.userToken = jsonDecode(response.body)['token'];
      Variables.prefs!.setString('token', jsonDecode(response.body)['token']);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EndScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Raqam yoki Parolni notog'ri kiritdingiz"),
          duration: Duration(seconds: 1),
        ),
      );
    }
    print(response.body);
  }

  String _splitFormatter(String number) {
    String _code =
        number.split('+')[1].split(' ')[0] + number.split('+')[1].split(' ')[1];
    String _number = number.split('+')[1].split(' ')[2].split('-')[0] +
        number.split('+')[1].split(' ')[2].split('-')[1] +
        number.split('+')[1].split(' ')[2].split('-')[2];
    String _phoneNumber = _code.toString() + _number.toString();

    return _phoneNumber;
  }

  void _checkValidate() {
    _formKey.currentState!.save();

    _phoneValidate = true;

    if (_phone.isEmpty) {
      _phoneValidate = false;
      _phoneValidateText = "Iltimos raqamingizni kiriting!";
    } else if (_phone.length < 17) {
      _phoneValidate = false;
      _phoneValidateText = "Iltimos raqamingizni to'liq kiriting!";
    }

    _passValidate = true;

    if (_pass.isEmpty) {
      _passValidate = false;
      _passValidateText = "Iltimos raqamingizni kiriting!";
    } else if (_pass.length < 4) {
      _passValidate = false;
      _passValidateText = "Iltimos raqamingizni to'liq kiriting!";
    }
  }
}
