import 'package:flutter/material.dart';
import 'package:fluttercodefactorywithapi230711/common/view/splash_screen.dart';

void main() {
  runApp(_App());
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "NotoSansKR"),
      home: SplashScreen(),
    );
  }
}
