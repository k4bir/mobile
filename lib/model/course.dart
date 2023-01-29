import 'package:batch_student_objbox_api/model/student.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'course.g.dart';

@Entity()
@JsonSerializable()
class Course {
  @Id(assignable: true)
  int id;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String courseId;
  String courseName;

  @Backlink()
  final student = ToMany<Student>();

  Course(this.courseId, this.courseName, {this.id = 0});

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
