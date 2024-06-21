import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/Screens/Auth/StudentAuth/student_login_screen.dart';
import 'package:lms/Screens/Auth/StudentAuth/student_signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
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
                color: Color(0xff2f4f60),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0),
                  bottomRight: Radius.circular(150),
                ),
              ),
            ),
          ),
          SizedBox(
            // height: 130,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Welcome! ',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: const Color(0xff2f4f60),
                          ),
                        ),
                        TextSpan(
                          text: 'Nice to See you, ',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: const Color(0xff2f4f60),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xffE4E6E7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: const Color(0xff2f4f60),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudentSignupScreen()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xffE4E6E7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Signup',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: const Color(0xff2f4f60),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 160.0,
              height: 170.0,
              decoration: const BoxDecoration(
                color: Color(0xff508aa9),
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
