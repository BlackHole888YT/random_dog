part of 'random_dog_cubit.dart';

sealed class RandomDogState {}

final class RandomDogInitial extends RandomDogState {}

final class GetDogInfo extends RandomDogState {
  final List<DogModel> dogs;

  GetDogInfo(this.dogs);
}

final class RandomDogError extends RandomDogState {
  final String message;

  RandomDogError(this.message);
}