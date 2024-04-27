import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test/core/errors/failures.dart';
import 'package:test/core/network/network_info.dart';
import 'package:test/features/home/data/datasources/home_remote_data_source.dart';
import 'package:test/features/home/data/models/person/person.dart';

abstract class HomeRepository {
  Future<Either<Failure, Person>> addPerson({required Person person});
  Future<Either<Failure, List<Person>>> getPersons();
}

class HomeRepositoryImpl implements HomeRepository {
  final NetworkInfo _networkInfo;
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepositoryImpl(
      {required NetworkInfo networkInfo,
      required HomeRemoteDataSource homeRemoteDataSource})
      : _networkInfo = networkInfo,
        _homeRemoteDataSource = homeRemoteDataSource;
  @override
  Future<Either<Failure, Person>> addPerson({required Person person}) async {
    if (await _networkInfo.connected()) {
      try {
        final response = await _homeRemoteDataSource.addPerson(person: person);
        return Right(response);
      } on DioException catch (error) {
        return Left(
          ServerFailure(
            error: error,
            type: NetworkErrorTypes.api,
          ),
        );
      }
    } else {
      return Left(
        ServerFailure(
          error: NoInternetConnection(),
          type: NetworkErrorTypes.noInternetConnection,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Person>>> getPersons() async {
    if (await _networkInfo.connected()) {
      try {
        final response = await _homeRemoteDataSource.getAllPersons();
        return Right(response);
      } on DioException catch (error) {
        return Left(
          ServerFailure(
            error: error,
            type: NetworkErrorTypes.api,
          ),
        );
      }
    } else {
      return Left(
        ServerFailure(
          error: NoInternetConnection(),
          type: NetworkErrorTypes.noInternetConnection,
        ),
      );
    }
  }
}
