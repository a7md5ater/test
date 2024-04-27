import 'package:test/core/apis/doctors/app_api.dart';
import 'package:test/core/apis/doctors/app_dio.dart';
import 'package:test/features/home/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test/core/network/network_info.dart';
import 'package:test/features/home/data/datasources/home_remote_data_source.dart';
import 'package:test/features/home/data/repositories/home_repository.dart';

final di = GetIt.instance;

void setupGetIt() {
  /// CUBITS
  di.registerLazySingleton<HomeCubit>(() => HomeCubit(di()));
  // di.registerLazySingleton<DoctorsCubit>(
  //     () => DoctorsCubit(getDoctorsUsecase: di()));
  // di.registerLazySingleton<ProductsCubit>(
  //     () => ProductsCubit(getProductsUsecase: di()));

  // /// DATASOURCES
  di.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(
        appApi: di(),
      ));
  // di.registerLazySingleton<ProductsRemoteDataSource>(
  //     () => ProductsRemoteDataSourceImpl(
  //           productsApi: di(),
  //         ));

  // /// REPOSITORIES
  di.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
        networkInfo: di(),
        homeRemoteDataSource: di(),
      ));
  // di.registerLazySingleton<ProductsRepository>(() => ProductsRepositoryImpl(
  //       networkInfo: di(),
  //       productsRemoteDataSource: di(),
  //     ));

  // /// USECASES
  // /// DOCTORS
  // di.registerLazySingleton<GetDoctorsUsecase>(
  //     () => GetDoctorsUsecase(doctorsRepository: di()));

  // /// PRODUCTS
  // di.registerLazySingleton<GetProductsUsecase>(
  //     () => GetProductsUsecase(productsRepository: di()));

  ///LOCAL STORAGE
  // di.registerLazySingleton<CartStorage>(() => CartStorageImpl());

  /// NETWORK INFO
  di.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: di()));
  di.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  /// APIS
  // / DIOs
  di.registerLazySingleton<AppDio>(() => AppDioImpl());

  /// APIS
  di.registerLazySingleton<AppApi>(
    () => AppApiImpl(dio: di<AppDio>().dio()),
  );
  // di.registerLazySingleton<ProductsApi>(() => ProductsApi());

  /// DIOs
  // Dio createAndSetupDoctorsDio() {
  //   Dio dio = Dio();

  //   dio.options
  //     ..baseUrl = DoctorsEndPoints.baseUrl
  //     ..responseType = ResponseType.plain
  //     ..headers = {
  //       'Content-Type': 'application/json',
  //     }
  //     ..connectTimeout = const Duration(seconds: 60)
  //     // ..receiveTimeout = const Duration(seconds: 60)
  //     ..followRedirects = false;

  //   dio.interceptors.add(
  //     LogInterceptor(
  //         request: true,
  //         requestBody: true,
  //         requestHeader: true,
  //         responseBody: true,
  //         responseHeader: true,
  //         error: true),
  //   );

  //   return dio;
  // }

  // di.registerLazySingleton<Dio>(() => createAndSetupDoctorsDio());
}
