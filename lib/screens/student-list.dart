import 'package:flutter/material.dart';
import 'package:flutter_std_mgmt/screens/common-utils.dart';
import 'package:flutter_std_mgmt/screens/login-screen.dart';
import 'package:flutter_std_mgmt/screens/new-student.dart';
import 'package:flutter_std_mgmt/screens/queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

List<Student> litems = [];
List<Student> originalList = [];

var refetchQuery;

var fnamefilter;

var studList;

var queryOptions = studList;

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
        lname: map["lname"],
        email: map["email"],
        phone: map["phone"]);
  }
}

final TextEditingController eCtrl = new TextEditingController();

class _StudentListState extends State<StudentList> {
  Color hoverColor = Color(0xfff1f1f1);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var studListFilter = QueryOptions(
      document: gql(Queries
          .studentListFilter), // this is the query string you just created
      pollInterval: Duration(seconds: 10),
      variables: {
        "_fname": fnamefilter,
      },
    );

    studList = QueryOptions(
      document:
          gql(Queries.studentList), // this is the query string you just created
      pollInterval: Duration(seconds: 10),
    );

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
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => NewStudent()),
                  );
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
                      controller: eCtrl,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        if (value.length > 0) {
                          setState(() {
                            fnamefilter = "%" + value + "%";
                            print("Filter  " + value);
                            queryOptions = studListFilter;
                          });
                        } else {
                          setState(() {
                            queryOptions = studList;
                          });
                        }
                      },
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
          //
          //
          //
          //
          Query(
            options: queryOptions,
            // Just like in apollo refetch() could be used to manually trigger a refetch
            // while fetchMore() can be used for pagination purpose
            builder: (QueryResult result,
                {VoidCallback refetch, FetchMore fetchMore}) {
              // refetchQuery = refetch;
              if (result.hasException) {
                return Text(result.exception.toString());
              }

              if (result.isLoading) {
                return Text('Loading');
              }

              // it can be either Map or List
              print("Hello Results" + result.data["studs"].toString());
              List resp = result.data["studs"];
              litems.clear();
              litems
                  .addAll(resp.map((item) => Student.fromJson(item)).toList());
              originalList = litems;

              return SingleChildScrollView(
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
              );
            },
          ),

          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: DataTable(
          //     columns: const <DataColumn>[
          //       DataColumn(
          //         label: Text(
          //           'Sr No',
          //           style: TextStyle(fontStyle: FontStyle.italic),
          //         ),
          //       ),
          //       DataColumn(
          //         label: Text(
          //           'FirstName',
          //           style: TextStyle(fontStyle: FontStyle.italic),
          //         ),
          //       ),
          //       DataColumn(
          //         label: Text(
          //           'LastName',
          //           style: TextStyle(fontStyle: FontStyle.italic),
          //         ),
          //       ),
          //       DataColumn(
          //         label: Text(
          //           'Email',
          //           style: TextStyle(fontStyle: FontStyle.italic),
          //         ),
          //       ),
          //       DataColumn(
          //         label: Text(
          //           'Phone',
          //           style: TextStyle(fontStyle: FontStyle.italic),
          //         ),
          //       ),
          //     ],
          //     rows: litems
          //         .map(
          //           (student) => DataRow(
          //               // onSelectChanged: (b) {
          //               //   print(student.id);
          //               // },
          //               cells: [
          //                 DataCell(Text(student.id.toString())),
          //                 DataCell(
          //                   Text(student.fname),
          //                 ),
          //                 DataCell(Text(student.lname)),
          //                 DataCell(
          //                   Text(student.email),
          //                 ),
          //                 DataCell(
          //                   Text(student.phone.toString()),
          //                 ),
          //               ]),
          //         )
          //         .toList(),
          //   ),
          // )
        ]),
      ),
    );
  }
}
