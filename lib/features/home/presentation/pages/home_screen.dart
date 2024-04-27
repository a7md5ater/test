import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/core/utils/app_values.dart';
import 'package:test/features/home/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is HomeGetPersonsLoading ||
            current is HomeGetPersonsSuccess ||
            current is HomGetPersonsError,
        builder: (context, state) {
          if (state is HomeGetPersonsLoading) {
            return const Center(child: Text("Loading"));
          } else if (state is HomGetPersonsError) {
            return const Center(child: Text("ERROR"));
          } else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(
                itemBuilder: (context, index) => Text(
                    "${context.read<HomeCubit>().persons[index].personId} - ${context.read<HomeCubit>().persons[index].name}"),
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppHeight.h10),
                itemCount: context.read<HomeCubit>().persons.length,
              ),
            );
          }
        },
      ),
    );
  }
}
