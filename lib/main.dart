import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vernacular_health/login/login_page.dart';
<<<<<<< HEAD
import 'package:vernacular_health/screens/about.dart';
import 'package:vernacular_health/screens/newsScreen.dart';
=======
import 'package:vernacular_health/login/otpVerification.dart';
>>>>>>> be019b804db395418093d1716266b37483bcce45

import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
<<<<<<< HEAD
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.indigo, // status bar color
  ));
=======
  await Firebase.initializeApp();
>>>>>>> be019b804db395418093d1716266b37483bcce45
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

  Future<List<String>> checkSignIn() {
    return Future.value(['notSignedIn', "login"]);
  }
}
