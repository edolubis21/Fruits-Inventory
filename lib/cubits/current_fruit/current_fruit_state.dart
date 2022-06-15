import 'package:equatable/equatable.dart';
import 'package:fruits_inventory/models/fruits.dart';

class CurrentFruitState extends Equatable {
  final String? imageUrl;
  final Fruit? fruit;

  const CurrentFruitState({
    required this.fruit,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [imageUrl, fruit];
}
