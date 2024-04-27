import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/features/home/cubit/home_cubit.dart';
import 'package:test/features/home/presentation/widgets/text_field_with_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is HomeGetPersonsLoading ||
            current is HomeGetPersonsSuccess ||
            current is HomGetPersonsError,
        builder: (context, state) {
          if (state is HomeGetPersonsLoading) {
            return Center(child: Text("Loading"));
          } else if (state is HomGetPersonsError) {
            return Center(child: Text("ERROR"));
          } else
            return Center(
                child: Text("${context.read<HomeCubit>().persons.length}"));
        },
      ),
    );
  }
}

class HomeTextFields extends StatelessWidget {
  const HomeTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        TextFieldWithTitle(
          controller: TextEditingController(),
          title: "title",
          hint: "hint",
          inputType: TextInputType.name,
        ),
        SizedBox(
          height: 10,
        ),
        TextFieldWithTitle(
          controller: TextEditingController(),
          title: "title",
          hint: "hint",
          inputType: TextInputType.name,
        ),
        SizedBox(
          height: 10,
        ),
        TextFieldWithTitle(
          controller: TextEditingController(),
          title: "title",
          hint: "hint",
          inputType: TextInputType.name,
        ),
      ]),
    );
  }
}
