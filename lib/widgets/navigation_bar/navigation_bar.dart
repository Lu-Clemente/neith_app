import 'package:flutter/material.dart';
import 'package:neith/views/index_controller.dart';

class NavigationBarWidget extends StatelessWidget {
  final IndexController controller;
  final Function(int) onItemTapped;

  const NavigationBarWidget({
    super.key,
    required this.controller,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: controller.currentTab,
      onTap: (int index) => onItemTapped(index),
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_outline),
          label: 'Travel Plans',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
