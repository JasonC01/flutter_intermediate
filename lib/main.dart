import 'package:flutter/material.dart';
import 'package:flutter_intermediate/common/component/custom_text_form_field.dart';
import 'package:flutter_intermediate/common/view/splash_screen.dart';
import 'package:flutter_intermediate/user/view/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: _App()));
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'NotoSans'),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
