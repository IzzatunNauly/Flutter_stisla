import 'package:flutter/material.dart';
import 'package:stisla_application_with_flutter/pages/homePage.dart';
import 'package:stisla_application_with_flutter/pages/kategoriHomePage.dart';
import 'package:stisla_application_with_flutter/pages/profilePage.dart';

class LandingHome extends StatefulWidget {
  const LandingHome({super.key});
  @override
  State<LandingHome> createState() => _LandingHomeState();
}

class _LandingHomeState extends State<LandingHome> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'Kategori',
          ),
          NavigationDestination(
            icon: Icon(Icons.accessibility),
            label: 'Profil',
          ),
        ],
      ),
      body: <Widget>[
        const HomePage(),
        const MainKategori(),
        const ProfilePage(),
      ][currentPageIndex],
    );
  }
}
