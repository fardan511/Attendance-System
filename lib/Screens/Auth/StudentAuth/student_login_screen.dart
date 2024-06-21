// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/Screens/Auth/TeacherAuth/teacher_login.dart';
import 'package:http/http.dart' as http;
import 'package:lms/Student_Dashboard/Student_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _registrationController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _studentLogin(BuildContext context) async {
    final Uri url =
        // Uri.parse('https://0e09-61-5-149-30.ngrok-free.app/api/v1/signin');
        Uri.parse('http://192.168.100.10:5001/api/v1/signin');
    try {
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'role': 'student',
          'registration': _registrationController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body)['user'];
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentDashboard(userData: responseData),
            ));
      } else if (response.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Student not found'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid password'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login failed'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error occurred. Please try again later.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 160.0,
              height: 170.0,
              decoration: const BoxDecoration(
                color: Color(0xff508aa9),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0),
                  bottomRight: Radius.circular(150),
                ),
              ),
            ),
          ),
          //
          SizedBox(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  'Login to Student Account! ',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: width * 0.05,
                    color: const Color(0xff508aa9),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _registrationController,
                  decoration: InputDecoration(
                    labelText: 'Registration Number',
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => _studentLogin(context),
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color(0xffE4E6E7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: const Color(0xff2f4f60),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login as ',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: const Color(0xff2f4f60),
                          ),
                        ),
                        TextSpan(
                          text: 'Teacher',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: const Color(0xff508aa9),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TeacherLoginScreen()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 160.0,
              height: 160.0,
              decoration: const BoxDecoration(
                color: Color(0xff2f4f60),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(150),
                  bottomLeft: Radius.circular(0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
