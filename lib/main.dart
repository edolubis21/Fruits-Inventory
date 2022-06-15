import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_inventory/cubits/current_fruit/current_fruit_cubit.dart';
import 'package:fruits_inventory/cubits/fruits/fruits_cubit.dart';
import 'package:fruits_inventory/repositories/fruit_repository.dart';
import 'package:fruits_inventory/views/screens/home/main.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FruitsCubit(
            repository: FruitRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => CurrentFruitCubit(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
