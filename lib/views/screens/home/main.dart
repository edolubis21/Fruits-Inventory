import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_inventory/cubits/fruits/fruits_cubit.dart';
import 'package:fruits_inventory/views/screens/home/widgets/action_button.dart';
import 'package:fruits_inventory/views/screens/home/widgets/image_fruit.dart';
import 'package:fruits_inventory/views/screens/home/widgets/list_fruit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _loadFruits();
  }

  void _loadFruits() => context.read<FruitsCubit>().loadFruits();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Fruits Data"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: const [
                Expanded(child: ListFruit()),
                Expanded(child: ImageFruit()),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: const ActionButton(),
          ),
        ],
      ),
    );
  }
}
