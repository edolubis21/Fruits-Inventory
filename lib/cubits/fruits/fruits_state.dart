import 'package:equatable/equatable.dart';
import 'package:fruits_inventory/models/fruits.dart';

abstract class FruitsState extends Equatable {}

class FruitsLoading extends FruitsState {
  @override
  List<Object?> get props => [];
}

class FruitsLoaded extends FruitsState {
  final Fruits data;

  FruitsLoaded({required this.data});

  @override
  List<Object?> get props => [data];
}
