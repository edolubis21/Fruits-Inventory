import 'package:equatable/equatable.dart';
import 'package:fruits_inventory/utils/extension.dart';

class Fruits extends Equatable {
  final Map<String, String> imagePreference;
  final List<Fruit> fruits;

  String? getImageByName(String name) {
    try {
      return imagePreference[name];
    } catch (_) {
      return null;
    }
  }

  FruitMostDuplicated getMostDuplicated() {
    try {
      int result = 0;
      String fruitName = "";
      for (final data in fruits) {
        final amount =
            fruits.where((element) => element.name == data.name).length;
        if (amount > result) {
          result = amount;
          fruitName = data.name.toCapitalized();
        } else if (amount == result &&
            !(fruitName.toLowerCase().contains(data.name.toLowerCase()))) {
          fruitName += ", ${data.name.toCapitalized()}";
        }
      }
      return FruitMostDuplicated(amount: result, name: fruitName);
    } catch (_) {
      return const FruitMostDuplicated(amount: 0, name: "");
    }
  }

  Fruits.fromJson(Map<String, dynamic> json)
      : imagePreference =
            json["data"]["imagesReferences"].cast<String, String>(),
        fruits = (json["data"]["fruits"] as List)
            .map<Fruit>(
              (e) => Fruit.fromJson(e),
            )
            .toList();

  @override
  List<Object?> get props => [
        imagePreference,
        fruits,
      ];
}

class Fruit extends Equatable {
  final String name;
  final int price;

  Fruit.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        price = json['price'];

  @override
  List<Object?> get props => [
        name,
        price,
      ];
}

class FruitMostDuplicated extends Equatable {
  final String name;
  final int amount;

  const FruitMostDuplicated({
    required this.name,
    required this.amount,
  });

  @override
  List<Object?> get props => [
        name,
        amount,
      ];
}
