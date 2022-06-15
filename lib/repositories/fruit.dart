import 'package:fruits_inventory/models/fruits.dart';
import 'package:fruits_inventory/utils/api_client.dart';

class FruitRepository {
  Future<Fruits> fetchFruits() async {
    final response =
        await ApiClient.shared.dio.post("/ta/challenges/fruits", data: {
      "data": {"imageReferences": true, "referenceId": "1650165235"}
    });
    return Fruits.fromJson(response.data);
  }
}
