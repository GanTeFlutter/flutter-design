import 'package:flutter/material.dart';
import 'package:travel_app_design/feature/home/favorite_card_page.dart';
import 'package:travel_app_design/feature/home/home_page.dart';

import '../../product/constant/colors.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      debugPrint('Seçilen index: $index');
    });
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ApplicationColors.scafoldbackroundcollor,
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: const [
              FavoritePage(),
              HomePage(),
              Bosekran(),
              Bosekran(),
            ],
          ),
          bottomNavigationBar(),
        ],
      ),
    );
  }

  Positioned bottomNavigationBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: ApplicationColors.white,
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            showUnselectedLabels: false,
            selectedItemColor: ApplicationColors.blue,
            unselectedItemColor: ApplicationColors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.navigation_rounded),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Bosekran extends StatelessWidget {
  const Bosekran({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(' Navigation', style: TextStyle(fontSize: 24)),
    );
  }
}
