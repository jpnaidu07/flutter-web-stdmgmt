import 'package:flutter/material.dart';
import 'package:flutter_std_mgmt/screens/student-model.dart';
import 'package:oktoast/oktoast.dart';

class NewStudent extends StatefulWidget {
  @override
  _NewStudentState createState() => _NewStudentState();
}

final _formkey = GlobalKey<FormState>();
final _scaffoldKey = GlobalKey<ScaffoldState>();

Student student = new Student();

class _NewStudentState extends State<NewStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        foregroundColor: Color(0xff489689),
        leadingWidth: 20,
        bottomOpacity: 2.0,
        backgroundColor: Color(0xff489689),
        title: Text("Student Registration"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 300,
              child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (item) =>
                            item.length > 2 ? null : "Enter Valid First Name",
                        onSaved: (item) => student.fname = item,
                        decoration: InputDecoration(
                            hintText: "First Name",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (item) =>
                            item.length > 2 ? null : "Enter Valid Last Name",
                        onSaved: (item) => student.lname = item,
                        decoration: InputDecoration(
                            hintText: "Last Name",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (item) =>
                            item.contains("@") ? null : "Enter valid email",
                        onSaved: (item) => student.email = item,
                        decoration: InputDecoration(
                            hintText: "Email", border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (item) =>
                            item.length > 2 ? null : "Enter Valid Phone",
                        onSaved: (item) => student.email = item,
                        decoration: InputDecoration(
                            hintText: "Phone", border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            _formkey.currentState.save();
                            showToast(
                              "Validation Successfull",
                              duration: Duration(seconds: 2),
                              position: ToastPosition.bottom,
                              backgroundColor: Colors.blue.withOpacity(0.8),
                              radius: 13.0,
                              textStyle: TextStyle(fontSize: 18.0),
                            );
                          }
                        },
                        child: Text("Register"),
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
