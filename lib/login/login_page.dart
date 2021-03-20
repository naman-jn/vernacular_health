import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          IgnorePointer(
            ignoring: loading,
            child: Opacity(
              opacity: loading ? 0.5 : 1,
              child: Container(
                color: Colors.deepPurple[400],
                child: Form(
                  key: formKey,
                  child: Column(children: [
                    Text("Vernacular Cancer App"),
                    SizedBox(height: 80),

                    Text(
                      "Enter your \nmobile number",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          letterSpacing: 1.2,
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "You will recieve a 6 digit code to verify next",
                      style: TextStyle(
                        letterSpacing: 1.2,
                        fontSize: 14,
                        color: Colors.white60,
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
                              color: Colors.white60,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Colors.white70)),
                            labelText: "Phone Number",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            prefixIcon:
                                Icon(Icons.phone, color: Colors.deepPurple),
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
                    // Builder(
                    //   builder: (context) => FlatButton(
                    //       onPressed: () async {
                    //         if (formKey.currentState.validate()) {
                    //           setState(() {
                    //             loading = true;
                    //           });
                    //           await OTPService().sendOTP(
                    //               "+91${phoneNumber.text}", context, false,
                    //               stopLoading: () {
                    //             setState(() {
                    //               loading = false;
                    //             });
                    //           });
                    //         } else
                    //           print("Errorrrrrrrrrrrrrrrr!");
                    //       },
                    //       textColor: Color(0XFF338678),
                    //       color: Color(0XFF338678),
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 15, horizontal: 25),
                    //       child: Text(
                    //         "Send OTP",
                    //         style: TextStyle(
                    //           fontSize: 20,
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       )),
                    // ),
                  ]),
                ),
              ),
            ),
          ),
          loading ? Center(child: CircularProgressIndicator()) : Container()
        ],
      ),
    );
  }
}
