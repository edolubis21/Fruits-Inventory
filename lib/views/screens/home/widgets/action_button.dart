import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_inventory/cubits/fruits/fruits_cubit.dart';
import 'package:fruits_inventory/cubits/fruits/fruits_state.dart';
import 'package:fruits_inventory/models/fruits.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({Key? key}) : super(key: key);

  Future<void> _showDialog(
    BuildContext context,
    FruitMostDuplicated fruit,
  ) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(fruit.name),
          content: Text("${fruit.name} total is ${fruit.amount}"),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FruitsCubit, FruitsState>(
      builder: (context, fruitsState) => ElevatedButton(
        onPressed: fruitsState is FruitsLoaded
            ? () => _showDialog(
                  context,
                  fruitsState.data.getMostDuplicated(),
                )
            : null,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "Action",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
