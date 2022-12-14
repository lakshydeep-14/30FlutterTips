import 'package:flutter/material.dart';
import './home.dart';
import 'bottomNavBar.dart';

class Tips30 extends StatefulWidget {
  Tips30({super.key});

  @override
  State<Tips30> createState() => _Tips30State();
}

class _Tips30State extends State<Tips30> {
  int _index = 0;
  final List<Widget> _body = [
    Home(
      text: "Tab1",
    ),
    Home(
      text: "tab2",
    ),
    Home(
      text: "tab3",
    )
  ];
  final _tab1navigatorKey = GlobalKey<NavigatorState>();
  final _tab2navigatorKey = GlobalKey<NavigatorState>();
  final _tab3navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return PersistentBottomBarScaffold(
      items: [
        PersistentTabItem(
          tab: _body[0],
          icon: Icons.home,
          title: 'Home',
          navigatorkey: _tab1navigatorKey,
        ),
        PersistentTabItem(
          tab: _body[1],
          icon: Icons.search,
          title: 'Search',
          navigatorkey: _tab2navigatorKey,
        ),
        PersistentTabItem(
          tab: _body[2],
          icon: Icons.book,
          title: 'Profile',
          navigatorkey: _tab3navigatorKey,
        ),
      ],
    );
  }
}
