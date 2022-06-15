import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_inventory/cubits/fruits/fruits_state.dart';
import 'package:fruits_inventory/repositories/fruit.dart';

class FruitsCubit extends Cubit<FruitsState> {
  final FruitRepository repository;

  FruitsCubit({
    required this.repository,
  }) : super(FruitsLoading());

  void loadFruits() async {
    try {
      final data = await repository.fetchFruits();
      emit(FruitsLoaded(data: data));
    } catch (_) {}
  }
}
