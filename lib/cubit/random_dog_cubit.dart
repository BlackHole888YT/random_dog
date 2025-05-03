import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/dog_model.dart';

part 'random_dog_state.dart';

class RandomDogCubit extends Cubit<RandomDogState> {
  final dio = Dio();
  RandomDogCubit() : super(RandomDogInitial());

  void getDogInfo() async {
    try {
      final response = await dio.get(
        'https://dogapi.dog/api/v2/breeds',
      );
      final data = response.data as Map<String, dynamic>;
      final breeds = data['data'] as List;
      final dogs = breeds.map((json) => DogModel.fromJson(json)).toList();
      emit(GetDogInfo(dogs));
    } catch (e) {
      emit(RandomDogError(e.toString()));
    }
  }
}
