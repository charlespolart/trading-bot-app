import 'package:flutter/material.dart';

import 'package:trading_bot_app/Style.dart';
import 'package:trading_bot_app/view/HistoryView.dart';
import 'package:trading_bot_app/view/StatisticsView.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<Widget> _widgets = [
    StatisticsView(),
    HistoryView(),
  ];
  int _currentIndex = 0;

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.euro),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _widgets,
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}
