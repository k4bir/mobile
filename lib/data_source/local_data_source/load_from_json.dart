// import 'dart:convert';

// import 'package:flutter/services.dart';
// import 'package:batch_student_objbox_api/helper/objectbox.dart';
// import 'package:batch_student_objbox_api/model/batch.dart';
// import 'package:batch_student_objbox_api/model/course.dart';
// import 'package:batch_student_objbox_api/model/student.dart';

// import '../../state/objectbox_state.dart';

// class LoadFromJsonDataSource {
//   ObjectBoxInstance get objectBoxInstance => ObjectBoxState.objectBoxInstance!;

//   Future<bool> loadFromJsonAndInsert() async {
//     bool flag = false;

//     final response =
//         await rootBundle.loadString('assets/json/student_course.json');

//     var json = jsonDecode(response);

//     for (var items in json) {
//       int stdId = items['stdId'] as int;
//       String fname = items['fname'];
//       String lname = items['lname'];
//       String username = items['username'];
//       String password = items['password'];
//       Student student = Student(fname, lname, username, password);
//       Batch batch = Batch(items['batch']['batchName']);
//       student.batch.target = batch;
//       for (var course in items['course']) {
//         Course courseObj = Course(course['courseName']);
//         student.course.add(courseObj);
//       }

//       // Add student to database
//       objectBoxInstance.addStudent(student);
//     }

//     return flag;
//   }
// }
