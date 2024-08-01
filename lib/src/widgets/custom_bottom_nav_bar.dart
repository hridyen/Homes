import 'package:homes/view/home_screen_view_model.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.model,
  }) : super(key: key);

  final HomeScreenViewModel model;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: model.selectedIndex,
      selectedItemColor: Colors.blueAccent, // Color for selected icon
      unselectedItemColor: Colors.grey, // Color for unselected icon
      backgroundColor: Colors.white, // Background color of the nav bar
      elevation: 0, // No shadow for a flat look
      onTap: model.onItemTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(

          label: '',
          icon: Icon(Icons.auto_graph_rounded),

        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.history),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.person_rounded),
        ),
      ],
    );
  }
}
