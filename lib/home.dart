import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vernacular_health/data/content.dart';
import 'package:vernacular_health/login/login_page.dart';
import 'package:vernacular_health/screens/What_is_Cancer.dart';
import 'package:vernacular_health/screens/about.dart';
import 'package:vernacular_health/screens/newsScreen.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Map data = Content().getHomeLanguage();
    List language = ["English", "Hindi", "Tamil"];
    String valueChoose;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        color: Colors.grey[100],
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Material(
                  child: Container(
                    width: screenWidth,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.indigo[700],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                            ),
                            child: Container(
                              width: screenWidth * 0.6,
                              child: Text(
                                "Cancer Care",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                    color: Colors.white),
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                icon: Image.asset("assets/translation.png"),
                                value: valueChoose,
                                onChanged: (newValue) {
                                  setState(() {
                                    valueChoose = newValue;
                                    userLanguage = newValue;
                                    print(newValue);
                                  });
                                },
                                items: language.map((valueItem) {
                                  return DropdownMenuItem(
                                      value: valueItem, child: Text(valueItem));
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    "Alert",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.red,
                                    ),
                                  ),
                                  content:
                                      Text("Do you really want to Log out?"),
                                  actions: [
                                    FlatButton(
                                      onPressed: () async {
                                        await FirebaseAuth.instance.signOut();
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LoginPage(),
                                            ),
                                            (route) => false);
                                      },
                                      child: Text(
                                        "Yes",
                                      ),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "No",
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Icon(
                            Icons.logout,
                            color: Colors.white54,
                            size: 30,
                          ),
                        ),
                        SizedBox(width: 9)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                cards(data["what"], navigate: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutPage()));
                }),
                SizedBox(height: 20),
                cards(data["type"], navigate: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Cancerit()));
                }),
                SizedBox(height: 20),
                cards(data["news"], navigate: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewsScreen()));
                }),
                SizedBox(height: 20),
                cards(
                  data["community"],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cards(String cardname, {Function navigate}) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InkWell(
        onTap: navigate,
        child: Container(
          height: 125,
          width: screenWidth * 0.90,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.indigo[700], Colors.indigo[200]],
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: [
                Text(
                  "$cardname",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
