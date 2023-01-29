import 'package:batch_student_objbox_api/model/student.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

//flutter pub run build_runner build  --delete-conflicting-outputs

@JsonSerializable()
@Entity()
class Batch {
  @Id(assignable: true)
  int id;

  @Unique()
  @JsonKey(name: '_id')
  String? batchId;
  String? batchName;

  @Backlink()
  final student = ToMany<Student>();

  Batch(this.batchId, this.batchName, {this.id = 0});

  factory Batch.fromJson(Map<String, dynamic> json) {
    return Batch(
      json['_id'],
      json['batchName'],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': batchId,
        'batchName': batchName,
      };
}
