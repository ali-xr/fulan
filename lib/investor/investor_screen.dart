import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fulanapp/auth/login_screen.dart';
import 'package:fulanapp/investor/student_item.dart';
import 'package:fulanapp/variables/variables.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:http/http.dart' as http;

class Investor extends StatefulWidget {
  const Investor({Key? key}) : super(key: key);

  @override
  State<Investor> createState() => _InvestorState();
}

class _InvestorState extends State<Investor> {
  bool _isLoading = false;
  List _students = [];
  @override
  void initState() {
    _getStudents().then((value) {
      setState(() {
        _students = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const CheckPhoneNumberScreen(),
              ),
              (Route<dynamic> route) => false,
            );
          },
          child:const Icon(Icons.logout),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Align(
            alignment: Alignment.center,
            child: Text(
              "Investitsiyaga Muhtoj Talabalar Ro'yxati",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _students.isNotEmpty
                ? GroupedListView<dynamic, String>(
                    elements: _students,
                    groupBy: (student) =>
                        '${DateTime.parse(student['createdAt']).day}/${DateTime.parse(student['createdAt']).month}/${DateTime.parse(student['createdAt']).year}',
                    groupComparator: (value1, value2) =>
                        value2.compareTo(value1),
                    itemComparator: (item1, item2) =>
                        item1['user_name'].compareTo(
                      item2['user_name'],
                    ),
                    order: GroupedListOrder.DESC,
                    useStickyGroupSeparators: true,
                    groupSeparatorBuilder: (String value) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        value,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    itemBuilder: (c, element) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (cotnext) => InvestorHome(
                                userId: element['user_id'],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 8.0,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            leading: const Icon(Icons.account_circle),
                            title: Text(
                                '${element['user_name']} ${element['user_lastName']}'),
                            trailing: const Icon(Icons.arrow_forward),
                          ),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text('Studentlar mavjud emas!'),
                  ),
      ),
    );
  }

  Future<List> _getStudents() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(
      Uri.parse('https://fulan-back.herokuapp.com/users/'),
      headers: {
        'Authorization': Variables.userToken!,
      },
    );

    print(response.body);
    print(response.statusCode);

    setState(() {
      _isLoading = false;
    });

    return jsonDecode(response.body)['data'] as List;
  }
}
