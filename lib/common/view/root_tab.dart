import 'package:flutter/material.dart';
import 'package:fluttercodefactorywithapi230711/common/const/colors.dart';
import 'package:fluttercodefactorywithapi230711/common/layout/defalut_layout.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;

  //? null 선언을 해도되지만, 아래 initstate에서 무조건 선언되는것을 알고 있기 때문에 late 를 사용한다.
  // ? 를 선언하면 관련되는 것에 ! 붙어야 하기때문에... 조금 귀찮아진다.

  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '코팩 딜리버리',
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: BODY_TEXT_COLOR,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          controller.animateTo(index);
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_outlined),
            label: '음식',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: '주문',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '프로필',
          ),
        ],
      ),
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(), // 죄우스크롤을 막는다.
        controller: controller,
        children: const [
          Center(
            child: Text('홈'),
          ),
          Center(
            child: Text('음식'),
          ),
          Center(
            child: Text('주문'),
          ),
          Center(
            child: Text('프로필'),
          ),
        ],
      ),
    );
  }
}
