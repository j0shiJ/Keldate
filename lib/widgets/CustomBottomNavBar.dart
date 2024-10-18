import 'package:flutter/material.dart';

class ScrollableBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  ScrollableBottomNavBar({
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  _ScrollableBottomNavBarState createState() => _ScrollableBottomNavBarState();
}

class _ScrollableBottomNavBarState extends State<ScrollableBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 80, // Adjust height to fit your design
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            buildNavBarItem(Icons.home, 0),
            buildNavBarItem(Icons.search, 1),
            buildNavBarItem(Icons.notifications, 2),
            buildNavBarItem(Icons.message, 3),
            buildNavBarItem(Icons.settings, 4),
            buildNavBarItem(Icons.account_circle, 5),
            buildNavBarItem(Icons.camera_alt, 6),
            buildNavBarItem(Icons.shopping_cart, 7),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onItemSelected(index);
      },
      child: Container(
        width: 80, // Adjust icon container width
        height: 80,
        color: widget.selectedIndex == index
            ? Colors.lightBlueAccent
            : Colors.blue,
        child: Icon(
          icon,
          color: Colors.white,
          size: 30, // Adjust icon size
        ),
      ),
    );
  }
}
