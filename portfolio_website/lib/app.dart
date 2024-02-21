import 'package:portfolio_website/controller/connection_controller.dart';
import 'package:portfolio_website/screens/404_screen/error_screen.dart'; // Assume this is your "no internet" screen
import 'package:portfolio_website/screens/nav_bar/nav_bar.dart';
import 'package:portfolio_website/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ChangeNotifierProvider(
        create: (context) => ConnectionController(),
        child: Builder(
          builder: (context) {
            // Use FutureBuilder to wait for the internet check
            return FutureBuilder<bool>(
              future:
                  context.read<ConnectionController>().hasInternetConnection(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // While waiting for the future to complete, show a loading indicator
                  return const MaterialApp(
                      home: Scaffold(
                          body: Center(child: CircularProgressIndicator())));
                } else if (snapshot.hasData && snapshot.data == true) {
                  // If there is an internet connection, proceed to the main screen
                  return MaterialApp(
                    title: 'Idan\'s Portfolio',
                    theme: myPortfolioTheme,
                    home: const NavBarScreen(),
                  );
                } else {
                  // If there is no internet connection, navigate to an error or "no internet" screen
                  return const MaterialApp(home: ErrorConnetionScreen());
                }
              },
            );
          },
        ),
      ),
    );
  }
}
