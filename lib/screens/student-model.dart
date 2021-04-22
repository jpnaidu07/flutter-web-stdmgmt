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
