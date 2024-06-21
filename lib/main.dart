// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:lms/Screens/Auth/StudentAuth/student_signup.dart';
import 'package:lms/Screens/Dashboard/attandanceinfo_screen.dart';
import 'package:lms/Screens/Dashboard/student_home.dart';
import 'package:lms/Screens/TeacherSection/teacher_home.dart';
import 'package:lms/Screens/splash_screen.dart';
import 'package:lms/Student_Dashboard/student_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
