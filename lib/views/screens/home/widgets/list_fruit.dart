import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_inventory/cubits/current_fruit/current_fruit_cubit.dart';
import 'package:fruits_inventory/cubits/fruits/fruits_cubit.dart';
import 'package:fruits_inventory/cubits/fruits/fruits_state.dart';
import 'package:fruits_inventory/utils/extension.dart';

class ListFruit extends StatelessWidget {
  const ListFruit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FruitsCubit, FruitsState>(
        builder: (context, fruitsState) {
      if (fruitsState is FruitsLoaded) {
        return Scrollbar(
          child: ListView.builder(
            itemCount: fruitsState.data.fruits.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => context.read<CurrentFruitCubit>().changeCurrentFruit(
                    fruit: fruitsState.data.fruits[index],
                    imageUrl: fruitsState.data
                        .getImageByName(fruitsState.data.fruits[index].name),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        fruitsState.data.fruits[index].name.toCapitalized(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      "Total Rp${fruitsState.data.fruits[index].price}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
      return const Center(child: CircularProgressIndicator());
    });
  }
}
