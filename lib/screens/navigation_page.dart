import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:login_screen/models/user_data.dart';
import 'package:login_screen/screens/addition_page.dart';
import 'package:login_screen/screens/analyze_page.dart';
import 'package:login_screen/screens/home_page.dart';
import 'package:login_screen/screens/settings_page.dart';

class NavigataionPage extends StatefulWidget {
  final UserData userData;
  const NavigataionPage({Key? key, required this.userData}) : super(key: key);

  @override
  State<NavigataionPage> createState() => _NavigataionPageState();
}

class _NavigataionPageState extends State<NavigataionPage> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      body: PageView(
        controller: pageController,
        children: [
          HomeScreen(userData: widget.userData),
          const AdditionPage(),
          const DeletePage(),
          SettingsPage(
            userData: widget.userData,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 110, 235, 208),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: GNav(
            gap: 5,
            backgroundColor: const Color.fromARGB(255, 110, 235, 208),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: const Color.fromARGB(255, 70, 186, 163),
            onTabChange: (value) {
              pageController.jumpToPage(value);
            },
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.add,
                text: 'Add',
              ),
              GButton(
                icon: Icons.adjust,
                text: 'Details',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
