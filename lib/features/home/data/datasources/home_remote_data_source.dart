import 'dart:convert';
import 'package:test/core/apis/doctors/app_api.dart';
import 'package:test/core/apis/doctors/app_end_points.dart';
import 'package:test/features/home/data/models/person/person.dart';

abstract class HomeRemoteDataSource {
  Future<Person> addPerson({required Person person});
  Future<List<Person>> getAllPersons();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final AppApi _appApi;

  HomeRemoteDataSourceImpl({required AppApi appApi}) : _appApi = appApi;
  @override
  Future<Person> addPerson({required Person person}) async {
    final response = await _appApi.post(
      endPoint: AppEndPoints.person + AppEndPoints.addPerson,
      body: person.toJson(),
    );
    return Person.fromJson(response.data);
  }

  @override
  Future<List<Person>> getAllPersons() async {
    final response = await _appApi.get(
      endPoint: AppEndPoints.person + AppEndPoints.getAllPersons,
    );
    final data = jsonDecode(response.data);
    List<Person> list = [];
    for (var element in data) {
      list.add(Person.fromJson(element));
    }
    return list;
  }
}
