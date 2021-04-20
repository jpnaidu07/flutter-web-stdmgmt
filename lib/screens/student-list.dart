import 'package:flutter/material.dart';
import 'package:flutter_std_mgmt/screens/common-utils.dart';
import 'package:flutter_std_mgmt/screens/login-screen.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

List<Student> litems = [];

class Student {
  int id;
  String fname;
  String lname;
  String email;
  int phone;
  Student({this.id, this.fname, this.lname, this.email, this.phone});
  factory Student.fromJson(Map<String, dynamic> map) {
    return Student(
        id: map["id"],
        fname: map["fname"],
        lname: map["id"],
        email: map["fname"],
        phone: map["phone"]);
  }
}

Student stu = new Student(
    id: 12,
    fname: "fnafddfdsfdsfsdfdsfdfds",
    lname: "lname",
    email: "dsdfd",
    phone: 3224332);

Student stu2 = new Student(
    id: 12,
    fname: "fnafddfdsfdsf",
    lname: "lname",
    email: "dsdfd",
    phone: 3224332);

final TextEditingController eCtrl = new TextEditingController();

class _StudentListState extends State<StudentList> {
  Color hoverColor = Color(0xfff1f1f1);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    litems.add(stu);
    litems.add(stu2);
    CommonUtils.checkForLogin(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(0xff489689),
        leadingWidth: 20,
        bottomOpacity: 2.0,
        backgroundColor: Color(0xff489689),
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Students List"),
              // Container(
              //   color: Colors.green,
              // child:
              ElevatedButton(
                onPressed: () {
                  CommonUtils.storage.clear();
                },
                child: Row(
                    children: [Icon(Icons.control_point), Text("Add Student")]),
                // ),
              ),
            ]),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          // Expanded(
          // child:
          Container(
            child: Row(
              children: [
                Icon(Icons.search),
                Text("Search : "),
                Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    height: 50,
                    width: 200.0,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 1),
                          border: OutlineInputBorder(),
                          fillColor: Colors.black),
                    ))
              ],
            ),
          ),
          // ),
          //

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Sr No',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'FirstName',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'LastName',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Email',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Phone',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              rows: litems
                  .map(
                    (student) => DataRow(
                        // onSelectChanged: (b) {
                        //   print(student.id);
                        // },
                        cells: [
                          DataCell(Text(student.id.toString())),
                          DataCell(
                            Text(student.fname),
                          ),
                          DataCell(Text(student.lname)),
                          DataCell(
                            Text(student.email),
                          ),
                          DataCell(
                            Text(student.phone.toString()),
                          ),
                        ]),
                  )
                  .toList(),
            ),
          )
        ]),
      ),
    );
  }
}
