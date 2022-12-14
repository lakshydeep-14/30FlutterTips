import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';

class PersistentBottomBarScaffold extends StatefulWidget {
  final List<PersistentTabItem> items;

  const PersistentBottomBarScaffold({Key? key, required this.items})
      : super(key: key);

  @override
  _PersistentBottomBarScaffoldState createState() =>
      _PersistentBottomBarScaffoldState();
}

class _PersistentBottomBarScaffoldState
    extends State<PersistentBottomBarScaffold> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.items[_selectedTab].navigatorkey?.currentState?.canPop() ??
            false) {
          widget.items[_selectedTab].navigatorkey?.currentState?.pop();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: _selectedTab,
          children: widget.items
              .map((page) => Navigator(
                    key: page.navigatorkey,
                    onGenerateInitialRoutes: (navigator, initialRoute) {
                      return [
                        MaterialPageRoute(builder: (context) => page.tab)
                      ];
                    },
                  ))
              .toList(),
        ),

        /// Define the persistent bottom bar
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: mainColor,
          currentIndex: _selectedTab,
          onTap: (index) {
            /// Check if the tab that the user is pressing is currently selected
            if (index == _selectedTab) {
              /// if you want to pop the current tab to its root then use
              widget.items[index].navigatorkey?.currentState
                  ?.popUntil((route) => route.isFirst);

              /// if you want to pop the current tab to its last page
              /// then use
              // widget.items[index].navigatorkey?.currentState?.pop();
            } else {
              setState(() {
                _selectedTab = index;
              });
            }
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: widget.items
              .map((item) => BottomNavigationBarItem(
                  icon: Icon(
                    item.icon,
                    color: _selectedTab == widget.items.indexOf(item)
                        ? Colors.white
                        : Colors.grey,
                  ),
                  label: item.title))
              .toList(),
        ),
      ),
    );
  }
}

/// Model class that holds the tab info for the [PersistentBottomBarScaffold]
class PersistentTabItem {
  final Widget tab;
  final GlobalKey<NavigatorState>? navigatorkey;
  final String title;
  final IconData icon;

  PersistentTabItem(
      {required this.tab,
      this.navigatorkey,
      required this.title,
      required this.icon});
}
