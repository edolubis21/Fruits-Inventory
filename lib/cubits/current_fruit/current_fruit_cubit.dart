import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_inventory/cubits/current_fruit/current_fruit_state.dart';
import 'package:fruits_inventory/models/fruits.dart';

class CurrentFruitCubit extends Cubit<CurrentFruitState> {
  CurrentFruitCubit()
      : super(
          const CurrentFruitState(fruit: null, imageUrl: null),
        );

  void changeCurrentFruit({required Fruit fruit, required String? imageUrl}) =>
      emit(
        CurrentFruitState(fruit: fruit, imageUrl: imageUrl),
      );
}
