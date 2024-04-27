import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:test/features/home/data/models/person/person.dart';
import 'package:test/features/home/data/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  HomeCubit(this.homeRepository) : super(HomeInitial());

  addPerson({required Person person}) async {
    emit(HomeAddPersonLoading());
    final response = await homeRepository.addPerson(person: person);
    response.fold(
      (l) => emit(HomAddPersonError(errorMsg: l.getMessage())),
      (r) => emit(HomeAddPersonSuccess()),
    );
  }

  List<Person> persons = [];
  getPersons() async {
    emit(HomeGetPersonsLoading());
    final response = await homeRepository.getPersons();
    response.fold(
      (l) => emit(HomGetPersonsError(errorMsg: l.getMessage())),
      (r) {
        persons = r;
        emit(HomeGetPersonsSuccess());
      },
    );
  }
}
