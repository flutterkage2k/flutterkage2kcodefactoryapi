import 'package:flutter/material.dart';
import 'package:fluttercodefactorywithapi230711/common/const/colors.dart';
import 'package:fluttercodefactorywithapi230711/common/const/data.dart';
import 'package:fluttercodefactorywithapi230711/common/layout/defalut_layout.dart';
import 'package:fluttercodefactorywithapi230711/common/view/root_tab.dart';
import 'package:fluttercodefactorywithapi230711/user/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // deleteToken();
    checkToken();
  }

  void deleteToken() async {
    await storage.deleteAll();
  }

  void checkToken() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    //제공되는 API에서의 refreshToken & accessToken 으로 네이밍이 설정되어있기 때문에 이런식으로 만든다.

    if (refreshToken == null || accessToken == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => LoginScreen(),
          ),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => RootTab(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/img/logo/logo.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
