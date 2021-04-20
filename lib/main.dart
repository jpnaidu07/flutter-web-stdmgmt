import 'package:flutter/material.dart';
import 'package:flutter_std_mgmt/screens/common-utils.dart';
import 'package:flutter_std_mgmt/screens/login-screen.dart';
import 'package:flutter_std_mgmt/screens/student-list.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  Widget _defaultHome = new LoginScreen();

  // Get result of the login function.
  bool _result = await CommonUtils.getVal("login");
  print("hello" + _result.toString());
  if (_result != null && _result) {
    _defaultHome = new MyHomePage(
      title: "Home",
    );
  }
  runApp(MyApp(
    def: _defaultHome,
  ));
}

class MyApp extends StatelessWidget {
  final Widget def;
  MyApp({this.def});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
          title: 'STUDENT MANAGEMENT',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: this.def),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

_getDrawerItemWidget(int pos) {
  switch (pos) {
    case 0:
      return new StudentList();

    default:
      return new Text("Error");
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var drwSel = 0;
  @override
  Widget build(BuildContext context) {
    CommonUtils.checkForLogin(context);
    return Scaffold(
      drawer: Drawer(
          child: ListView(children: [
        DrawerHeader(
          child: Container(
            child: Center(
              child: Icon(Icons.pest_control),
            ),
            color: Colors.green[400],
          ),
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
        ),
        ListTile(
          title: Text("Students"),
          leading: Icon(Icons.home),
          onTap: () {
            Navigator.pop(context);
            StudentList();
            setState(() {
              drwSel = 0;
            });
            return StudentList();
          },
        ),
        ListTile(
          title: Text("Add Student"),
          leading: Icon(Icons.control_point),
          onTap: () {
            Navigator.pop(context);
            setState(() {
              drwSel = 1;
            });
          },
        ),
        ListTile(
          title: Text("Sign Out"),
          leading: Icon(Icons.outlet),
          onTap: () {
            Navigator.pop(context);
            setState(() {
              drwSel = 2;
            });
          },
        )
      ])),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _getDrawerItemWidget(drwSel),
      // body: LoginScreen(),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
