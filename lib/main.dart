import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jasmine_app/src/home/home_screen.dart';
import 'package:jasmine_app/util/keyboard_manager.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Jasmine Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          elevation: 5.0,
          centerTitle: true,
        )
      ),
      home: HomeScreen(),
    );
  }
}
