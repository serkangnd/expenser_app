import 'package:flutter/material.dart';
import 'package:login_screen/models/user_data.dart';
import 'package:login_screen/screens/login_page.dart';

class SettingsPage extends StatelessWidget {
  final UserData userData;
  const SettingsPage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: const Color.fromARGB(255, 110, 235, 208),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 250),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "E - Mail: ${userData.userMail.toString()}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  showLogoutDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 110, 235, 208),
                  elevation: 5,
                ),
                child: const Text(
                  "Log Out",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }

  void showLogoutDialog(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 10,
        title: const Text(
          "Hey!",
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "Are you sure you want to log out?",
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancel",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 31, 93, 79),
                fontSize: 14,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              //push and remove until methodu stacki temizliyor.
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                (_) => false,
              );
            },
            child: const Text(
              "Continue",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 31, 93, 79),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
