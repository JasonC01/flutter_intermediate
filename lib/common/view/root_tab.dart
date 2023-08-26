import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_intermediate/common/const/colors.dart';
import 'package:flutter_intermediate/layout/default_layout.dart';
import 'package:flutter_intermediate/restaurant/view/restaurant_screen.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  int index = 0;
  late TabController controller;

  @override
  void dispose() {
    controller.removeListener(tabListener);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListener);
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "코팩 딜리버리",
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          RestaurantScreen(),
          Center(
            child: Text("음식"),
          ),
          Center(
            child: Text("주문"),
          ),
          Center(
            child: Text("프로필"),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: PRIMARY_COLOR,
          unselectedItemColor: BODY_TEXT_COLOR,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.shifting,
          onTap: (int index) {
            controller.animateTo(index);
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: '홈'),
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood_outlined), label: '음식'),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_outlined), label: '주문'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: '프로필'),
          ]),
    );
  }
}
