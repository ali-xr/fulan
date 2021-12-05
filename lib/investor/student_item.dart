import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fulanapp/size_config.dart';
import 'package:fulanapp/variables/variables.dart';
import 'package:http/http.dart' as http;

class InvestorHome extends StatefulWidget {
  final String userId;
  const InvestorHome({Key? key, required this.userId}) : super(key: key);

  @override
  _InvestorHomeState createState() => _InvestorHomeState();
}

class _InvestorHomeState extends State<InvestorHome> {
  bool _isLoading = false;

  dynamic _student = null;

  @override
  void initState() {
    _getStudent(widget.userId).then((value) {
      setState(() {
        _student = value;
      });
    });

    super.initState();
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
                          Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.amber, width: 2.5),
                                color: Colors.white),
                            child: Icon(
                              Icons.person,
                              size: 30.0,
                              color: Colors.blue.shade800,
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
                            "+${_student['user_phone']}",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black54.withOpacity(0.6)),
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
                    ],
                  ),
                )
              : const Center(
                  child: Text('Bunday student topilmadi!'),
                ),
    );
  }

  Future<dynamic> _getStudent(String userId) async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(
      Uri.parse('https://fulan-back.herokuapp.com/users/get-student'),
      headers: {
        'Authorization': Variables.userToken!,
        'user-id': userId,
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
