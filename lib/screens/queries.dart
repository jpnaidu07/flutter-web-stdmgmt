class Queries {
  static String studentList = """query MyQuery {
  studs:stdapp_students {
    id
    department
    email
    fname
    lname
    phone
  }
}""";

  static String studentListFilter = """query MyQuery( \$_fname: String) {
  studs: stdapp_students(where: {fname: {_like: \$_fname}}) {
    id
    department
    email
    fname
    lname
    phone
  }
}""";
}
