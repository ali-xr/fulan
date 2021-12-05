import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fulanapp/auth/login_screen.dart';
import 'package:fulanapp/size_config.dart';
import 'package:fulanapp/variables/variables.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  bool _isLoading = false;

  dynamic _student;

  @override
  void initState() {
    _getStudent().then((value) {
      setState(() {
        _student = value;
      });
    });

    super.initState();
  }

  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _student != null
              ? Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => getImage(),
                            child: _image == null
                                ? Container(
                                    height: 100.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.amber, width: 2.5),
                                        color: Colors.white),
                                    child: Icon(
                                      Icons.person,
                                      size: 30.0,
                                      color: Colors.blue.shade800,
                                    ),
                                  )
                                : Container(
                                    height: 70.0,
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.amber, width: 2.5),
                                      color: Colors.black54,
                                      image: DecorationImage(
                                        image: FileImage(_image!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: Colors.black54.withOpacity(0.05),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              child: ListTile(
                                title: const Text(
                                  "Name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black54,
                                  ),
                                ),
                                subtitle: Text(
                                  '${_student['user_name']} ${_student['user_lastName']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black54.withOpacity(0.6)),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.black54,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.black54.withOpacity(0.05),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          title: const Text(
                            "Phone number",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black54,
                            ),
                          ),
                          subtitle: Text(
                            '+${_student['user_phone']}',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black54.withOpacity(0.6)),
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.black54,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.black54.withOpacity(0.05),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: const ListTile(
                          leading: Icon(
                            CupertinoIcons.doc,
                            color: Colors.black54,
                          ),
                          title: Text(
                            "PASSPORT JSHSHIR",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.black54.withOpacity(0.05),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: const ListTile(
                          leading: Icon(
                            CupertinoIcons.doc_on_clipboard,
                            color: Colors.black54,
                          ),
                          title: Text(
                            "PASSPORT SERIYA",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.black54.withOpacity(0.05),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: const ListTile(
                          leading: Icon(
                            Icons.badge,
                            color: Colors.black54,
                          ),
                          title: Text(
                            "University",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.black54.withOpacity(0.05),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: const ListTile(
                          leading: Icon(
                            Icons.local_fire_department_sharp,
                            color: Colors.black54,
                          ),
                          title: Text(
                            "MOTIVATION XAT",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.black54.withOpacity(0.05),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: const ListTile(
                          leading: Icon(
                            Icons.support_agent,
                            color: Colors.black54,
                          ),
                          title: Text(
                            "Support",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionScreenHeight(160.0),
                      ),
                      SizedBox(
                        height: getProportionScreenHeight(60.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            primary: const Color.fromRGBO(15, 15, 84, 1),
                          ),
                          child: Text(
                            "LOG AUT",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: getProportionScreenWidth(20.0),
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.1,
                            ),
                          ),
                          onPressed: () {
                            // _checkValidate();
                            // if (_formKey.currentState!.validate()) {
                            //   singIn(_phone, _pass);
                            // } else {}
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CheckPhoneNumberScreen(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: Text('Bunday student topilmadi!'),
                ),
    );
  }

  Future<dynamic> _getStudent() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(
      Uri.parse('https://fulan-back.herokuapp.com/users/get'),
      headers: {
        'Authorization': Variables.userToken!,
      },
    );

    print(response.body);
    print(response.statusCode);

    setState(() {
      _isLoading = false;
    });

    return jsonDecode(response.body)['data'];
  }
}
