class Queries {
  static String studentList = """query MyQuery {
  stdapp_students {
    department
    email
    first_name
    last_name
    phone
  }
}""";
}
