import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vernacular_health/login/login_page.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vernacular Health',
      debugShowCheckedModeBanner: false,
      home: CheckUserStatus(),
    );
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
