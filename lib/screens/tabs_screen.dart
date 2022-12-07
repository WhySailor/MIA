import 'package:flutter/material.dart';
import 'package:mia/screens/info_drawer.dart';

import '../blocs/blocs.dart';
import '../models/mia.dart';
import 'completed_task_screen.dart';
import 'favorite_task_screen.dart';
import 'main_task_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const id = "tabs_screen";

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': const CompletedTaskScreen(), 'title': 'Completed Tasks'},
    {'pageName': const MainTaskScreen(), 'title': 'Main Task'},
    {'pageName': const FavoriteTaskScreen(), 'title': 'Favorite Tasks'},
  ];

  var _selectedPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: BlocBuilder<MiaBloc, MiaState>(
          builder: (context, state) {
            Mia mia = state.mia;
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    backgroundColor: const Color.fromARGB(125, 255, 255, 255),
                    strokeWidth: 7,
                    color: const Color.fromARGB(255, 88, 255, 94),
                    value: mia.mood / 100,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      drawer: const InfoDrawer(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: "Chat",
          ),
        ],
      ),
    );
  }
}
