import 'package:flutter/material.dart';
import 'animal_list_screen.dart';
import 'dashboard_model.dart';
import 'favourite_screen.dart';
import 'homeScreen.dart';

class DashboardScreen extends StatefulWidget{
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreen();
  }

class _DashboardScreen extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    Homescreen(),
    AnimalListScreen(),
    FavouriteScreen(),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAnimals(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
