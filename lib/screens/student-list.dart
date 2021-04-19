import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    litems.add(stu);
    litems.add(stu2);
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Color(0xff489689),
          leadingWidth: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
              bottom: Radius.circular(30),
            ),
          ),
          bottomOpacity: 2.0,
          backgroundColor: Color(0xff489689),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Students List"),
                Container(
                  color: Colors.green,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(children: [
                      Icon(Icons.control_point),
                      Text("Add Student")
                    ]),
                  ),
                ),
              ]),
        ),
        body: Column(
          children: [
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
            DefaultTextStyle(
              style: TextStyle(fontWeight: FontWeight.bold),
              child: Container(
                height: 80,
                child: Card(
                  color: Color(0xfff1f1f1),
                  child: Row(children: <Widget>[
                    SizedBox(
                      width: 70,
                    ),
                    Container(
                      width: 110,
                      child: Row(
                        children: [
                          Icon(Icons.sync),
                          Text("Sr No"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Container(
                      width: 110,
                      child: Row(
                        children: [
                          Icon(Icons.person),
                          Text("First Name"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Container(
                      width: 110,
                      child: Row(
                        children: [
                          Icon(Icons.person),
                          Text("Last Name"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Container(
                      width: 110,
                      child: Row(
                        children: [
                          Icon(Icons.email),
                          Text("Email"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Container(
                      width: 110,
                      child: Row(
                        children: [
                          Icon(Icons.phone),
                          Text("Phone"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Container(
                      width: 110,
                      child: Row(
                        children: [
                          Icon(Icons.edit),
                          Text("Update"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Container(
                      width: 110,
                      child: Row(
                        children: [
                          Icon(Icons.delete),
                          Text("Delete"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                  ]),
                ),
              ),
            ),

            ListView.builder(
                shrinkWrap: true,
                itemCount: litems.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  Student stud = (litems[index]);
                  // return the header
                  return Container(
                      height: 80,
                      child: InkWell(
                        onTap: () {
                          print("object");
                        },
                        child: Card(
                          elevation: 40,
                          shadowColor: Colors.teal[100],
                          color: Color(0xfff1f1f1),
                          child: Row(children: <Widget>[
                            SizedBox(
                              width: 70,
                            ),
                            Container(
                                width: 110, child: Text(stud.id.toString())),
                            SizedBox(
                              width: 70,
                            ),
                            Container(width: 110, child: Text(stud.fname)),
                            SizedBox(
                              width: 70,
                            ),
                            Container(width: 110, child: Text(stud.lname)),
                            SizedBox(
                              width: 70,
                            ),
                            Container(width: 110, child: Text(stud.email)),
                            SizedBox(
                              width: 70,
                            ),
                            Container(
                                width: 110, child: Text(stud.phone.toString())),
                            SizedBox(
                              width: 70,
                            ),
                            Container(
                              width: 110,
                              child: ButtonTheme(
                                minWidth: 80,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Update"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Container(
                              width: 110,
                              child: ButtonTheme(
                                minWidth: 80,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Delete"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                          ]),
                        ),
                      ));
                })
          ],
        ));
    // new TextField(
    //   controller: eCtrl,
    //   // onSubmitted: (text) {
    //   //   litems.add(text);
    //   //   eCtrl.clear();
    //   //   setState(() {});
    //   // },
    // ),
    // Container(
    // child:
    // Container(
    //     child: new ListView.builder(
    //         itemCount: litems.length,
    //         itemBuilder: (BuildContext ctxt, int index) {
    //           Student stud = (litems[index]);
    //           if (index == 0) {
    //             // return the header
    //             return Card(
    //               color: Colors.grey,
    //               child: Row(children: <Widget>[
    //                 Expanded(
    //                     child: Column(
    //                   children: [
    //                     Icon(Icons.sync),
    //                     Text("Sr No"),
    //                   ],
    //                 )),
    //                 Expanded(
    //                     child: Column(
    //                   children: [
    //                     Icon(Icons.person),
    //                     Text("First Name"),
    //                   ],
    //                 )),
    //                 Expanded(
    //                     child: Column(
    //                   children: [
    //                     Icon(Icons.person),
    //                     Text("Last Name"),
    //                   ],
    //                 )),
    //                 Expanded(
    //                     child: Column(
    //                   children: [
    //                     Icon(Icons.email),
    //                     Text("Email"),
    //                   ],
    //                 )),
    //                 Expanded(
    //                     child: Column(
    //                   children: [
    //                     Icon(Icons.phone),
    //                     Text("Phone"),
    //                   ],
    //                 )),
    //                 Expanded(
    //                     child: Column(
    //                   children: [
    //                     Icon(Icons.edit),
    //                     Text("Update"),
    //                   ],
    //                 )),
    //                 Expanded(
    //                     child: Column(
    //                   children: [
    //                     Icon(Icons.delete),
    //                     Text("Delete"),
    //                   ],
    //                 )),
    //               ]),
    //             );
    //           }

    //           return Card(
    //             color: Colors.black,
    //             // child: ,
    //           );
    //         })),
    // )
  }
}
