import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'random_dog_state.dart';

class RandomDogCubit extends Cubit<RandomDogState> {
  final dio = Dio();
  RandomDogCubit() : super(RandomDogInitial());

  void getDogImage() async{
    final response = await dio.get(
      'https://dog.ceo/api/breeds/image/random',
    );
    final data = response.data;
    final image = data['message'] as String;
    emit(GetRandomImage(image));

  }

}
