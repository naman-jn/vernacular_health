import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vernacular_health/login/login_page.dart';

import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.indigo, // status bar color
  ));
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vernacular Health',
        debugShowCheckedModeBanner: false,
        home: CheckUserStatus());
  }
}

class CheckUserStatus extends StatefulWidget {
  CheckUserStatus({Key key}) : super(key: key);

  @override
  _CheckUserStatusState createState() => _CheckUserStatusState();
}

class _CheckUserStatusState extends State<CheckUserStatus> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkSignIn(),
        builder: (context, snapshot) {
          var page;
          if (snapshot.hasData) {
            switch (snapshot.data[1]) {
              case "login":
                {
                  page = LoginPage();
                  break;
                }
              case "home":
                {
                  page = HomePage();
                  break;
                }
            }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: page,
            );
          } else {
            return Container(
              color: Colors.white,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [Center(child: CircularProgressIndicator())],
              ),
            );
          }
        });
  }

  Future<List<String>> checkSignIn() async {
    if (FirebaseAuth.instance.currentUser != null)
      return [FirebaseAuth.instance.currentUser.uid, "home"];
    else
      return ['notSignedIn', "login"];
  }
}
