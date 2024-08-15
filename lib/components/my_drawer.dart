import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasknest/about_page.dart';
import 'package:tasknest/components/my_text.dart';
import 'package:tasknest/home_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,

      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: MyText(
                  giveText: 'TaskNest',
                  fontSize: 40,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10 , top: 10),
            child: ListTile(
              iconColor: Theme.of(context).colorScheme.primary,
              leading: const Icon(
                CupertinoIcons.question_square,
                size: 20,
              ),
              title: const Text(
                'H o m e',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10 , top: 10),
            child: ListTile(
              iconColor: Theme.of(context).colorScheme.primary,
              leading: const Icon(
                CupertinoIcons.question_square,
                size: 20,
              ),
              title: const Text(
                'A b o u t',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AboutPage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
