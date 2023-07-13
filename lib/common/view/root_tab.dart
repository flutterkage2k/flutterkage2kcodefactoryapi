import 'package:flutter/material.dart';
import 'package:fluttercodefactorywithapi230711/common/const/colors.dart';
import 'package:fluttercodefactorywithapi230711/common/layout/defalut_layout.dart';

class RootTab extends StatelessWidget {
  const RootTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: Center(
      child: Text('RootTab'),
    ));
  }
}
