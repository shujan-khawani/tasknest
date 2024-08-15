import 'package:flutter/material.dart';
import 'package:tasknest/components/my_drawer.dart';
import 'package:tasknest/components/my_text.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'About',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            //Image
            Expanded(
              child: Image.asset('images/About_Logo.png'),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyText(
                              giveText: 'App Title:',
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary),
                          MyText(
                              giveText: 'Task Nest',
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.onSecondary),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyText(
                              giveText: 'Developed By:',
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary),
                          MyText(
                              giveText: 'Shujan Khakwani',
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.onSecondary),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyText(
                              giveText: 'Email:',
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary),
                          MyText(
                              giveText: 'shujankhakwani489@gmail.com',
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.onSecondary),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
