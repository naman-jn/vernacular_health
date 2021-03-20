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
    Color babyBlue = Color(0XFFC8C8C8);
    Color yaleBlue = Color(0XFF5E6483);
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
                    colors: [babyBlue, yaleBlue],
                  )),
                  child: Form(
                    key: formKey,
                    child: Column(children: [
                      SizedBox(height: 140),
                      Text(
                        "Cancer care",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            letterSpacing: 1.5),
                      ),
                      SizedBox(height: 120),
                      Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "You will recieve a 6 digit code to verify next",
                        style: TextStyle(
                          letterSpacing: 1.2,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 40),
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
                                width: 2,
                                color: Colors.deepOrangeAccent,
                              )),
                              errorStyle:
                                  TextStyle(color: Colors.deepOrangeAccent),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 2,
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
                            // color: Colors.blueGrey,
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
            loading ? Center(child: CircularProgressIndicator()) : Container()
          ],
        ),
      ),
    );
  }
}
