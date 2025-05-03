import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/random_dog_cubit.dart';
import 'widgets/dog_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Информация о собаках'),
        centerTitle: true,
      ),
      body: BlocBuilder<RandomDogCubit, RandomDogState>(
        builder: (context, state) {
          if (state is RandomDogInitial) {
            context.read<RandomDogCubit>().getDogInfo();
            return const Center(child: CircularProgressIndicator());
          }
          
          if (state is GetDogInfo) {
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: state.dogs.length,
              itemBuilder: (context, index) {
                return DogCard(dog: state.dogs[index]);
              },
            );
          }

          if (state is RandomDogError) {
            print('Error: ${state.message}');
            return Center(
              child: Text(
                'Ошибка: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}


