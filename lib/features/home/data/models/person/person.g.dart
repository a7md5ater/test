// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      personId: (json['personID'] as num?)?.toInt(),
      name: json['name'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      age: (json['age'] as num?)?.toInt(),
      nationalityId: (json['nationalityID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'personID': instance.personId,
      'name': instance.name,
      'birthDate': instance.birthDate?.toIso8601String(),
      'age': instance.age,
      'nationalityID': instance.nationalityId,
    };
