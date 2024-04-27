import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  @JsonKey(name: 'personID')
  int? personId;
  String? name;
  DateTime? birthDate;
  int? age;
  @JsonKey(name: 'nationalityID')
  int? nationalityId;

  Person({
    this.personId,
    this.name,
    this.birthDate,
    this.age,
    this.nationalityId,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return _$PersonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
