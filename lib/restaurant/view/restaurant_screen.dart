import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_intermediate/common/const/data.dart';
import 'package:flutter_intermediate/restaurant/component/restaurant_card.dart';
import 'package:flutter_intermediate/restaurant/model/restaurant_model.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  Future<List> paginateRestaurant() async {
    final dio = Dio();
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final resp = await dio.get('http://$ip/restaurant',
        options: Options(headers: {'authorization': 'Bearer $accessToken'}));

    return resp.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FutureBuilder<List>(
                future: paginateRestaurant(),
                builder: (context, AsyncSnapshot<List> snapshot) {
                  print(snapshot.data);
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  return ListView.separated(
                      itemBuilder: (_, index) {
                        final item = snapshot.data![index];
                        final pItem = RestaurantModel.fromJson(json: item);

                        return RestaurantCard.fromModel(model: pItem);
                      },
                      separatorBuilder: (_, index) {
                        return SizedBox(
                          height: 16.0,
                        );
                      },
                      itemCount: snapshot.data!.length);
                },
              ))),
    );
  }
}
