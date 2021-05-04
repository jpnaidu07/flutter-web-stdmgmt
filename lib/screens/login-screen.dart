import 'package:flutter/material.dart';
import 'package:flutter_std_mgmt/main.dart';
import 'package:flutter_std_mgmt/screens/common-utils.dart';
import 'package:oktoast/oktoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;

  final _formkey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Color(0xff489689),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: SingleChildScrollView(
                child: Card(
                  elevation: 10,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Form(
                        key: _formkey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 350,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (item) {
                                  return item.contains("@")
                                      ? null
                                      : "Enter valid Email";
                                },
                                onChanged: (item) {
                                  setState(() {
                                    _email = item;
                                  });
                                },
                                decoration: InputDecoration(
                                    hintText: "Enter Email",
                                    labelText: "Email",
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 350,
                              child: TextFormField(
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                validator: (item) {
                                  return item.length > 6
                                      ? null
                                      : "Password must be 6 characters";
                                },
                                onChanged: (item) {
                                  setState(() {
                                    _password = item;
                                  });
                                },
                                decoration: InputDecoration(
                                    hintText: "Enter Password",
                                    labelText: "Password",
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 90,
                              child: ElevatedButton(
                                onPressed: () {
                                  login();
                                },
                                child: Text(
                                  "Login  ✓",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              color: Colors.blue[200],
                              child: Text(
                                  "Use admin@yopmail.com and admin123 as credentials"),
                            )
                          ],
                        )),
                  ),
                ),
              ),
            ),
    );
  }

  bool validateCred(String email, String password) {
    return _email == "admin@yopmail.com" && _password == "admin123";
  }

  void login() {
    if (_formkey.currentState.validate()) {
      print(validateCred(_email, _password));
      if (validateCred(_email, _password)) {
        setState(() {
          isLoading = true;
        });
        showToast(
          "✓ Login Successfull",
          duration: Duration(seconds: 2),
          position: ToastPosition.bottom,
          backgroundColor: Colors.blue.withOpacity(0.8),
          radius: 13.0,
          textStyle: TextStyle(fontSize: 18.0),
        );
        CommonUtils.setLogin(true);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => MyHomePage(title: 'HOME')),
            (Route<dynamic> route) => false);
      } else {
        showToast(
          "X Invalid Credentials",
          context: context,
          duration: Duration(seconds: 2),
          position: ToastPosition.bottom,
          backgroundColor: Colors.red.withOpacity(0.8),
          radius: 13.0,
          textStyle: TextStyle(fontSize: 18.0),
        );
      }
    }
  }
}
