import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/nav_bar/controller/nav_bar_controller.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key, required this.controller});

  final NavBarController controller;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      color: Theme.of(context).scaffoldBackgroundColor,
      fontSize: 15,
    );
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 155, 128, 251),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            curve: Curves.easeInOutCubicEmphasized,
            decoration: BoxDecoration(               
              color: Color.fromARGB(255, 155, 128, 251),
            ),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image(
                image: AssetImage('assets/my_pictures/logo_transparent.png'),
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading:
                const Icon(Icons.home, color: Color.fromARGB(255, 0, 0, 0)),
            title: Text('Home', style: textStyle),
            onTap: () {
              Navigator.pop(context);
              controller.onDestinationSelected(0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.menu_book,
                color: Color.fromARGB(255, 0, 0, 0)),
            title: Text(
              'Projects',
              style: textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              controller.onDestinationSelected(1);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            title: Text('About me', style: textStyle),
            onTap: () {
              Navigator.pop(context);
              controller.onDestinationSelected(2);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.arrow_outward_rounded,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            title: Text('Facebook', style: textStyle),
            onTap: () {
              Navigator.pop(context);
              controller.openUrl(controller.faceBookLink);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.arrow_outward_rounded,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            title: Text('GitHub', style: textStyle),
            onTap: () {
              Navigator.pop(context);
              controller.openUrl(controller.gitHubLink);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.arrow_outward_rounded,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            title: Text('LinkedIn', style: textStyle),
            onTap: () {
              Navigator.pop(context);
              controller.openUrl(controller.linkedInLink);
            },
          ),
        ],
      ),
    );
  }
}
