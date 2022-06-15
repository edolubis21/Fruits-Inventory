import 'package:flutter_test/flutter_test.dart';
import 'package:fruits_inventory/models/fruits.dart';

void main() {
  group("Fruits Model", () {
    test("should parse from json", () {
      final fruits = Fruits.fromJson(_mockResponse1);
      expect(fruits.fruits.length, 11);
      expect(fruits.fruits[0].name, "melon");
    });

    test("should get Image byName", () {
      final fruits = Fruits.fromJson(_mockResponse1);
      expect(fruits.getImageByName("melon"),
          "https://s3.amazonaws.com/pix.iemoji.com/images/emoji/apple/ios-12/256/melon.png");
      expect(fruits.getImageByName("strawberry"), null);
    });

    test("should get Most Duplicated", () {
      final fruits = Fruits.fromJson(_mockResponse1);
      expect(fruits.getMostDuplicated(),
          const FruitMostDuplicated(name: "Banana", amount: 2));
      final fruits2 = Fruits.fromJson(_mockResponse2);
      expect(fruits2.getMostDuplicated(),
          const FruitMostDuplicated(name: "Banana, Cherry", amount: 2));
    });
  });
}

final _mockResponse1 = {
  "message": "SUCCESS",
  "code": 200,
  "data": {
    "imagesReferences": {
      "apple":
          "https://upload.wikimedia.org/wikipedia/commons/d/d5/Apple_icon_1.png",
      "manggo":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Hapus_Mango.jpg/574px-Hapus_Mango.jpg",
      "banana":
          "https://www.pngall.com/wp-content/uploads/2016/04/Banana-Free-Download-PNG.png",
      "avocado":
          "https://e7.pngegg.com/pngimages/972/264/png-clipart-sliced-avocado-fruit-illustration-emoji-domain-apple-avocado-emoji-food-fruit.png",
      "melon":
          "https://s3.amazonaws.com/pix.iemoji.com/images/emoji/apple/ios-12/256/melon.png"
    },
    "fruits": [
      {"name": "melon", "price": 100},
      {"name": "banana", "price": 150},
      {"name": "avocado", "price": 100},
      {"name": "manggo", "price": 175},
      {"name": "apple", "price": 100},
      {"name": "strawberry", "price": 50},
      {"name": "durian", "price": 75},
      {"name": "lemon", "price": 80},
      {"name": "papaya", "price": 90},
      {"name": "cherry", "price": 95},
      {"name": "banana", "price": 150}
    ]
  }
};

final _mockResponse2 = {
  "message": "SUCCESS",
  "code": 200,
  "data": {
    "imagesReferences": {
      "apple":
          "https://upload.wikimedia.org/wikipedia/commons/d/d5/Apple_icon_1.png",
      "manggo":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Hapus_Mango.jpg/574px-Hapus_Mango.jpg",
      "banana":
          "https://www.pngall.com/wp-content/uploads/2016/04/Banana-Free-Download-PNG.png",
      "avocado":
          "https://e7.pngegg.com/pngimages/972/264/png-clipart-sliced-avocado-fruit-illustration-emoji-domain-apple-avocado-emoji-food-fruit.png",
      "melon":
          "https://s3.amazonaws.com/pix.iemoji.com/images/emoji/apple/ios-12/256/melon.png"
    },
    "fruits": [
      {"name": "melon", "price": 100},
      {"name": "banana", "price": 150},
      {"name": "avocado", "price": 100},
      {"name": "manggo", "price": 175},
      {"name": "apple", "price": 100},
      {"name": "strawberry", "price": 50},
      {"name": "durian", "price": 75},
      {"name": "lemon", "price": 80},
      {"name": "papaya", "price": 90},
      {"name": "cherry", "price": 95},
      {"name": "cherry", "price": 95},
      {"name": "banana", "price": 150}
    ]
  }
};
