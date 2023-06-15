import 'package:flutter/material.dart';
import 'package:login_application/screens/login_page.dart';
import 'package:login_application/screens/screen_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('HOME'),
        actions: [
          IconButton(
              onPressed: () {
                signOutAlert(context);
                // signout(context);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black,
            ),
            height: 50,
            width: 100,
            child: TextButton(
              onPressed: () => {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ScreenListForChat(),
                )),
              },
              child: const Text(
                'Go to List',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  signout(BuildContext ctx) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();

    // ignore: use_build_context_synchronously
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => const LoginPage(),
        ),
        (route) => false);
  }

  signOutAlert(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Log out'),
        content: const Text('Are you shure want to Log out'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              signout(context);
            },
            icon: const Icon(Icons.check),
            label: const Text('Yes'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            icon: const Icon(Icons.close),
            label: const Text('No'),
          ),
        ],
      ),
    );
  }
}
