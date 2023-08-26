import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final String? title;
  final Widget? bottomNavigationBar;
  const DefaultLayout(
      {required this.child,
      this.backgroundColor,
      this.title,
      this.bottomNavigationBar,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      bottomNavigationBar: bottomNavigationBar,
      body: child,
      appBar: renderAppBar(),
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        title: Text(
          title!,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      );
    }
  }
}
