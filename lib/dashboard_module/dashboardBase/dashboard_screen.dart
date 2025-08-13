import 'package:flutter/material.dart';
import '../exploreTab/animal_list_screen.dart';
import '../viewModel/dashboard_model.dart';
import '../favoritesTab/favourite_screen.dart';
import '../homeTab/homeScreen.dart';

class DashboardScreen extends StatefulWidget{
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreen();
  }

class _DashboardScreen extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Homescreen(),
    const AnimalListScreen(),
    const FavouriteScreen(),
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
