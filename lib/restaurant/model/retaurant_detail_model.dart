import 'package:flutter_intermediate/restaurant/model/restaurant_model.dart';

import '../../common/const/data.dart';

class RestaurantDetailModel extends RestaurantModel {
  final String detail;
  final List<RestaurantProductModel> products;
  RestaurantDetailModel(this.detail, this.products,
      {required super.id,
      required super.name,
      required super.thumbUrl,
      required super.tags,
      required super.priceRange,
      required super.ratings,
      required super.ratingsCount,
      required super.deliveryTime,
      required super.deliveryFee});

  factory RestaurantDetailModel.fromJson({required Map<String, dynamic> json}) {
    return RestaurantDetailModel(
      json['detail'],
      json['products']
          .map<RestaurantProductModel>(
              (x) => RestaurantProductModel.fromJson(json: x))
          .toList(),
      id: json['id'],
      name: json['name'],
      thumbUrl: 'http://$ip${json['thumbUrl']}',
      tags: List<String>.from(json['tags']),
      priceRange: RestaurantPriceRange.values
          .firstWhere((e) => e.name == json['priceRange']),
      ratings: json['ratings'],
      ratingsCount: json['ratingsCount'],
      deliveryTime: json['deliveryTime'],
      deliveryFee: json['deliveryFee'],
    );
  }
}

class RestaurantProductModel {
  final String id;
  final String name;
  final String imgUrl;
  final String detail;
  final int price;

  factory RestaurantProductModel.fromJson(
      {required Map<String, dynamic> json}) {
    return RestaurantProductModel(
        id: json['id'],
        name: json['name'],
        imgUrl: 'http://$ip${json['imgUrl']}',
        detail: json['detail'],
        price: json['price']);
  }

  RestaurantProductModel(
      {required this.id,
      required this.name,
      required this.imgUrl,
      required this.detail,
      required this.price});
}