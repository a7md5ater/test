import 'package:test/app/injector.dart';
import 'package:test/config/app_theme.dart';
import 'package:test/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/features/home/presentation/pages/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => di<HomeCubit>()..getPersons(),
              ),
              // BlocProvider(
              //   create: (BuildContext context) =>
              //       di<DoctorsCubit>()..getDoctors(),
              // ),
              // BlocProvider(
              //   create: (BuildContext context) =>
              //       di<ProductsCubit>()..getProducts(),
              // ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme(),
              home: const HomeScreen(),
            ),
          );
        });
  }
}
