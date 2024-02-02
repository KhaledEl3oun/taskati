import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/thems/thems.dart';
import 'package:taskati/features/addTask/addTask.dart';
import 'package:taskati/features/home/profile/splash.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('user');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const splash(),
    );
  }
}
