import 'dart:io';

import 'package:batch_student_objbox_api/app/network_connectivity.dart';
import 'package:batch_student_objbox_api/data_source/local_data_source/student_data_source.dart';
import 'package:batch_student_objbox_api/data_source/remote_data_source/student_data_source.dart';
import 'package:batch_student_objbox_api/model/student.dart';

abstract class StudentRepository {
  Future<List<Student>> getStudents();
  Future<List<Student>?> getStudentsByCourse(String courseId);
  Future<List<Student>?> getStudentsByBatch(String batchId);
  Future<int> addStudent(File? file, Student student);
  Future<bool> loginStudent(String username, String password);
}

class StudentRepositoryImpl extends StudentRepository {
  @override
  Future<int> addStudent(File? file, Student student) async {
    bool status = await NetworkConnectivity.isOnline();
    if (status) {
      return StudentRemoteDataSource().addStudent(file, student);
    } else {
      return StudentDataSource().addStudent(file, student);
    }
  }

  @override
  Future<List<Student>> getStudents() async {
    bool status = await NetworkConnectivity.isOnline();
    if (status) {
      return StudentDataSource().getStudents();
    } else {
      // Get from local database , for now send empty is there is no internet
      return [];
    }
  }

  @override
  Future<bool> loginStudent(String username, String password) async {
    bool status = await NetworkConnectivity.isOnline();
    if (status) {
      return StudentRemoteDataSource().loginStudent(username, password);
    } else {
      return StudentDataSource().loginStudent(username, password);
    }
  }

  @override
  Future<List<Student>?> getStudentsByBatch(String batchId) async {
    bool status = await NetworkConnectivity.isOnline();
    if (status) {
      return StudentRemoteDataSource().getStudentsByBatch(batchId);
    } else {
      return [];
    }
  }

  @override
  Future<List<Student>?> getStudentsByCourse(String courseId) async {
    bool status = await NetworkConnectivity.isOnline();
    if (status) {
      return StudentRemoteDataSource().getStudentsByCourse(courseId);
    } else {
      return [];
    }
  }
}
