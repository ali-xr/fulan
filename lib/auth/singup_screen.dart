import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:fulanapp/auth/verify_screen.dart';
import 'package:fulanapp/constants.dart';
import 'package:fulanapp/size_config.dart';
import 'package:fulanapp/widgets/custom_app_bar.dart';
import 'package:http/http.dart' as http;

class InputNameScreen extends StatefulWidget {
  final String phoneNumber;
  const InputNameScreen({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  _InputNameScreenState createState() => _InputNameScreenState();
}

class _InputNameScreenState extends State<InputNameScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _surname = "";
  String _phone = "";
  String _pass = "";
  bool _isTapped = false;

  bool _nameValidate = true;
  bool _surnameValidate = true;
  bool _phoneValidate = true;
  bool _passwordValidate = true;

  String _nameValidateText = "";
  String _surnameValidateText = "";
  String _phoneValidateText = "";
  String _passwordValidateText = "";
  final TextEditingController _textEditingController = TextEditingController();

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
                            cursorWidth: getProportionScreenWidth(1.0),
                            keyboardType: TextInputType.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.1,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(247, 247, 247, 1),
                              hintText: "Ismingiz",
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
                              if (_nameValidate) {
                                return null;
                              }

                              return _nameValidateText;
                            },
                            onSaved: (text) {
                              _name = text!;
                            },
                            onChanged: (text) {
                              setState(() {
                                _nameValidate = true;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            cursorWidth: getProportionScreenWidth(1.0),
                            keyboardType: TextInputType.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.1,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(247, 247, 247, 1),
                              hintText: "Familyangiz",
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
                              if (_surnameValidate) {
                                return null;
                              }

                              return _surnameValidateText;
                            },
                            onSaved: (text) {
                              _surname = text!;
                            },
                            onChanged: (text) {
                              setState(() {
                                _surnameValidate = true;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
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
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
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
                              if (_passwordValidate) {
                                return null;
                              }

                              return _passwordValidateText;
                            },
                            onChanged: (text1) {
                              setState(() {
                                _passwordValidate = true;
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
                  const Spacer(),
                ],
              ),
            ),
            CustomAppBar(
              child: Text(
                "Ro'yxatdan o'tish",
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
                      "Ro'yxatdan o'tish",
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
                        singUp(_name, _surname, _phone, _pass);
                      }
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

  void singUp(
    name,
    surname,
    phone,
    pass,
  ) async {
    final response = await http.post(
      Uri.parse("https://fulan-back.herokuapp.com/users/sign-up"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode({
        'phone': _splitFormatter(phone),
        'name': name,
        'surname': surname,
        'password': pass,
      }),
    );

    print(response.body);
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegistorVerifySms(
              phone: phone, data: jsonDecode(response.body)['data']['code_id']),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Siz Royxatdan o'tdingiz"),
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

  _checkValidate() {
    _formKey.currentState!.save();

    _phoneValidate = true;
    _passwordValidate = true;
    _nameValidate = true;
    _surnameValidate = true;
    if (_name.isEmpty) {
      _nameValidate = false;
      _nameValidateText = "Iltimos ismingizni kiriting!";
    } else if (_name.length < 3) {
      _nameValidate = false;
      _nameValidateText = "Iltimos ismingizni to'liq kiriting!";
    } else if (_phone.isEmpty) {
      _surnameValidate = false;
      _surnameValidateText = "Iltimos raqamingizni kiriting!";
    } else if (_phone.length < 3) {
      _surnameValidate = false;
      _surnameValidateText = "Iltimos raqamingizni to'liq kiriting!";
    } else if (_phone.isEmpty) {
      _phoneValidate = false;
      _phoneValidateText = "Iltimos raqamingizni kiriting!";
    } else if (_phone.length < 17) {
      _phoneValidate = false;
      _phoneValidateText = "Iltimos raqamingizni to'liq kiriting!";
    } else if (_pass.isEmpty) {
      _passwordValidate = false;
      _passwordValidateText = "Iltimos raqamingizni kiriting!";
    } else if (_pass.length < 4) {
      _passwordValidate = false;
      _passwordValidateText = "Iltimos raqamingizni to'liq kiriting!";
    }
  }
}
