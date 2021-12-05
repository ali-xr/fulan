import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fulanapp/constants.dart';
import 'package:fulanapp/auth/student_sign_screen.dart';
import 'package:fulanapp/investor/investor_screen.dart';
import 'package:fulanapp/size_config.dart';
import 'package:fulanapp/variables/variables.dart';

class EndScreen extends StatefulWidget {
  const EndScreen({Key? key}) : super(key: key);

  @override
  _HammasiTayyorState createState() => _HammasiTayyorState();
}

class _HammasiTayyorState extends State<EndScreen> {
  bool _student = false;
  bool _investor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionScreenWidth(24.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: getProportionScreenHeight(54.0)),
            Text(
              "Yo'nalishni Tanlang",
              style: TextStyle(
                color: kTextColor,
                fontSize: getProportionScreenWidth(26.0),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: getProportionScreenHeight(100.0),
            ),
            InputChip(
              backgroundColor: Colors.grey.shade200,
              padding: const EdgeInsets.all(2.0),
              avatar: const CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xFFc1adea),
                child: Text(
                  'T',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
              label: SizedBox(
                width: 120,
                height: 70,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Talaba',
                    style: TextStyle(
                        color: _student ? Colors.white : Colors.black,
                        fontSize: 30),
                  ),
                ),
              ),
              selected: _student,
              selectedColor: Colors.blue.shade600,
              onSelected: (bool selected) {
                setState(() {
                  _student = selected;
                  _investor = !selected;
                });
              },
              // onDeleted: () {},
            ),
            SizedBox(
              height: getProportionScreenHeight(50.0),
            ),
            InputChip(
              backgroundColor: Colors.grey.shade200,
              padding: const EdgeInsets.all(2.0),
              avatar: const CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xFFc1adea),
                child: Text(
                  'I',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
              label: SizedBox(
                width: 120,
                height: 70,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Investor',
                    style: TextStyle(
                        color: _investor ? Colors.white : Colors.black,
                        fontSize: 30),
                  ),
                ),
              ),
              selected: _investor,
              selectedColor: Colors.blue.shade600,
              onSelected: (bool selected) {
                setState(() {
                  _investor = selected;
                  _student = !selected;
                });
              },
              // onDeleted: () {},
            ),
            SizedBox(
              height: getProportionScreenHeight(300.0),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: getProportionScreenHeight(60.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(15, 15, 84, 1),
                    ),
                    onPressed: () {
                      if (_student == true) {
                        Variables.prefs!.setString('role', 'student');

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentSignScreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      } else {
                        Variables.prefs!.setString('role', 'investor');

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Investor(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      }
                    },
                    child: Text(
                      "Tayyor",
                      style: TextStyle(
                        fontSize: getProportionScreenWidth(20.0),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => Student(),
                //       ),
                //     );
                //   },
                //   child: Container(
                //     height: getProportionScreenHeight(58.0),
                //     alignment: Alignment.center,
                //     child: Text(
                //       "O`tkazib yuborish",
                //       style: TextStyle(
                //         fontSize: getProportionScreenWidth(16.0),
                //         fontWeight: FontWeight.w400,
                //         color: Colors.grey,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
