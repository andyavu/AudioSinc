import "package:flutter/material.dart";
import "adjust_audio.dart";
import "settings.dart";

void main() => runApp(App());

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  final List<Widget> pages = [
    Home(),
    Settings(),
  ];

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) {
    return BottomNavigationBar(
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      currentIndex: selectedIndex,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.volume_up,
              color: (_selectedIndex == 0) ? Colors.orange : Colors.white60,
            ),
            title: Text("Adjust Latency Offset")
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: (_selectedIndex == 1) ? Colors.orange : Colors.white60,
            ),
            title: Text("Settings")
        ),
      ],
      backgroundColor: Color(0xFF161616),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body:
      IndexedStack(
        children: <Widget>[
          Home(),
          Settings(),
        ],
        index: _selectedIndex,
      ),
      backgroundColor: Color(0xFF161616),
    );
  }
}
