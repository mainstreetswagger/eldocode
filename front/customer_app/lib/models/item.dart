import 'package:flutter/services.dart';

class Item {
  late String id;
  late String categoryId;
  late String name;
  late String description;
  late double price;
  late bool isSold;
  late String image;
  Item(
      {required this.id,
      required this.categoryId,
      required this.name,
      required this.description,
      required this.price,
      required this.isSold,
      required this.image});

  Item.fromJson(Map<String, dynamic> json)
      : id = json['Id'],
        categoryId = json['CategoryId'],
        name = json['Name'],
        description = json['Desciption'],
        price = json['Price'],
        isSold = json['IsSold'],
        image = json['Image'];
}
