import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasknest/splash_screen.dart';
import 'package:tasknest/theme/themes.dart';

void main() async {

  //Initializing hive
  await Hive.initFlutter();

  //Initialize Box
  var box = await Hive.openBox('mybox');

  runApp(const TaskNest());
}

class TaskNest extends StatelessWidget {
  const TaskNest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Nest',
      theme: lightMode,
      darkTheme: darkMode,
      home: const SplashScreen(),
    );
  }
}
