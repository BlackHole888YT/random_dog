import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_dog/cubit/random_dog_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cubit = RandomDogCubit();

  @override
  void initState() {
    super.initState();
    cubit.getDogImage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<RandomDogCubit, RandomDogState>(
      bloc: cubit,
      builder: (context, state){
        if (state is GetRandomImage) {
          return Center(
            child: Column(
              children: [
                Image.network(state.image, height: 400, width: 400,),
                FloatingActionButton(
                  onPressed: () => cubit.getDogImage(),
                  child: const Icon(Icons.refresh),
                ),
              ],
            ),
          );
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ),);
  }
}


