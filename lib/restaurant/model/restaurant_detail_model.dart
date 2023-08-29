import 'package:flutter_intermediate/restaurant/model/restaurant_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../common/const/data.dart';
import '../../common/utils/data_utils.dart';

part 'restaurant_detail_model.g.dart';

@JsonSerializable()
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

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDetailModelFromJson(json);
}

@JsonSerializable()
class RestaurantProductModel {
  final String id;
  final String name;
  @JsonKey(fromJson: DataUtils.pathToUrl)
  final String imgUrl;
  final String detail;
  final int price;

  // factory RestaurantProductModel.fromJson(
  //     {required Map<String, dynamic> json}) {
  //   return RestaurantProductModel(
  //       id: json['id'],
  //       name: json['name'],
  //       imgUrl: 'http://$ip${json['imgUrl']}',
  //       detail: json['detail'],
  //       price: json['price']);
  // }

  factory RestaurantProductModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantProductModelFromJson(json);

  RestaurantProductModel(
      {required this.id,
      required this.name,
      required this.imgUrl,
      required this.detail,
      required this.price});
}
