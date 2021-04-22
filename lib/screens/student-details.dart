import 'package:flutter/material.dart';
import 'package:flutter_std_mgmt/screens/common-utils.dart';
import 'package:flutter_std_mgmt/screens/constants.dart';
import 'package:flutter_std_mgmt/screens/student-model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class StudentDetails extends StatefulWidget {
  final int stId;
  const StudentDetails({this.stId});

  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              Text("Student Details"),
            ]),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Subscription(
              options: SubscriptionOptions(
                  document: gql(
                    r'''
          subscription studDetails($_eq: Int) {
  stud:stdapp_students(where: {id: {_eq: $_eq}}) {
    id
    lname
    phone
    fname
    email
    department
  }
}
            ''',
                  ),
                  variables: {"_eq": widget.stId}),
              builder: (result) {
                if (result.hasException) {
                  return Text(result.exception.toString());
                }

                if (result.isLoading) {
                  return Center(
                    child: const CircularProgressIndicator(),
                  );
                }

                print("Hello Details" + result.data["stud"].toString());
                Student stud = result.data["stud"]
                    .map((item) => Student.fromJson(item))
                    .toList()[0];
                return ResultAccumulator.appendUniqueEntries(
                    latest: result.data,
                    builder: (context, {results}) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Constants.padding),
                            ),
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            child: contentBox(context, stud),
                          ),
                        ));
              },
            )
          ]),
        ),
      ),
    );
  }

  contentBox(BuildContext context, Student stud) {
    return Stack(
      children: <Widget>[
        Container(
          width: 300,
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.black.withOpacity(0.9)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Card(
                    shadowColor: Colors.blue,
                    elevation: 1,
                    child: Row(
                      children: [
                        Text("Id : ",
                            style: TextStyle(fontWeight: FontWeight.w400)),
                        Expanded(
                            child: Text(stud.id.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                )))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Card(
                    shadowColor: Colors.blue,
                    elevation: 1,
                    child: Row(
                      children: [
                        Text("Fisrt Name : ",
                            style: TextStyle(fontWeight: FontWeight.w400)),
                        Expanded(
                            child: Text(
                          stud.fname,
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Card(
                    shadowColor: Colors.blue,
                    elevation: 1,
                    child: Row(
                      children: [
                        Text("Last Name : ",
                            style: TextStyle(fontWeight: FontWeight.w400)),
                        Expanded(
                            child: Text(stud.lname,
                                style: TextStyle(
                                  color: Colors.blue,
                                )))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Card(
                    shadowColor: Colors.blue,
                    elevation: 1,
                    child: Row(
                      children: [
                        Text("Email : ",
                            style: TextStyle(fontWeight: FontWeight.w400)),
                        Expanded(
                            child: Text(stud.email,
                                style: TextStyle(
                                  color: Colors.blue,
                                )))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Card(
                    shadowColor: Colors.blue,
                    elevation: 1,
                    child: Row(
                      children: [
                        Text("Phone : ",
                            style: TextStyle(fontWeight: FontWeight.w400)),
                        Expanded(
                            child: Text(stud.phone.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                )))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: Image.asset("images/jp.png")),
          ),
        ),
      ],
    );
  }
}
