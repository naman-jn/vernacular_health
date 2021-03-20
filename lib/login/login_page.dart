import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vernacular_health/login/otp.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneNumber = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool loading;

  @override
  void initState() {
    super.initState();
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    Color babyBlue = Color(0XFFA7CCFF);
    Color yaleBlue = Color(0XFF304D6D);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            IgnorePointer(
              ignoring: loading,
              child: Opacity(
                opacity: loading ? 0.5 : 1,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.indigo[300],
                      Colors.indigo[800],
                    ],
                  )),
                  child: Form(
                    key: formKey,
                    child: Column(children: [
                      SizedBox(height: 170),
                      Text(
                        "Cancer Care",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5),
                      ),
                      SizedBox(height: 100),
                      Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.phone,
                            controller: phoneNumber,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 1,
                                color: Colors.deepOrangeAccent,
                              )),
                              errorStyle:
                                  TextStyle(color: Colors.deepOrangeAccent),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 1,
                                color: Colors.white,
                              )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.white70)),
                              hintText: "Phone number",
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                              prefixIcon:
                                  Icon(Icons.phone, color: Colors.white),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            validator: (value) {
                              if (value.length != 10) {
                                return "Invalid phone number";
                              }
                            },
                          )),
                      SizedBox(height: 10),
                      Text(
                        "You will recieve a 6 digit code to verify next",
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 30),
                      Builder(
                        builder: (context) => FlatButton(
                            onPressed: () async {
                              if (formKey.currentState.validate()) {
                                setState(() {
                                  loading = true;
                                });
                                await OTPService().sendOTP(
                                    "+91${phoneNumber.text}", context, false,
                                    stopLoading: () {
                                  setState(() {
                                    loading = false;
                                  });
                                });
                              } else
                                print("Errorrrrrrrrrrrrrrrr!");
                            },
                            textColor: Color(0XFF338678),
                            color: Colors.indigo[400],
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 25),
                            child: Text(
                              "Send OTP",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
            loading
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    child: Center(child: CircularProgressIndicator()))
                : Container()
          ],
        ),
      ),
    );
  }
}
