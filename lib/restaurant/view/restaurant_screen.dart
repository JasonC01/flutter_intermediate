import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_intermediate/common/const/data.dart';
import 'package:flutter_intermediate/common/dio/dio.dart';
import 'package:flutter_intermediate/common/model/cursor_pagination_model.dart';
import 'package:flutter_intermediate/restaurant/component/restaurant_card.dart';
import 'package:flutter_intermediate/restaurant/model/restaurant_model.dart';
import 'package:flutter_intermediate/restaurant/repository/restaurant_repository.dart';
import 'package:flutter_intermediate/restaurant/view/restuarant_detail_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FutureBuilder<CursorPagination<RestaurantModel>>(
                future: ref.watch(restaurantRepositoryProvider).paginate(),
                builder: (context,
                    AsyncSnapshot<CursorPagination<RestaurantModel>> snapshot) {
                  print(snapshot.data);
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.separated(
                      itemBuilder: (_, index) {
                        final pItem = snapshot.data!.data[index];

                        return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      RestaurantDetailScreen(id: pItem.id)));
                            },
                            child: RestaurantCard.fromModel(model: pItem));
                      },
                      separatorBuilder: (_, index) {
                        return SizedBox(
                          height: 16.0,
                        );
                      },
                      itemCount: snapshot.data!.data.length);
                },
              ))),
    );
  }
}
