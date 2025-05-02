part of 'random_dog_cubit.dart';

sealed class RandomDogState {}

final class RandomDogInitial extends RandomDogState {}

final class GetRandomImage extends RandomDogState {
  final String image;

  GetRandomImage(this.image);
}