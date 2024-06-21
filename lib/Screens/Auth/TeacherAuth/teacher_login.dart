import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/Screens/TeacherSection/teacher_home.dart';

class TeacherLoginScreen extends StatefulWidget {
  const TeacherLoginScreen({super.key});

  @override
  State<TeacherLoginScreen> createState() => _TeacherLoginScreenState();
}

class _TeacherLoginScreenState extends State<TeacherLoginScreen> {
  bool _obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
            ],
          ),
          //
          SizedBox(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'Login to Teacher Account! ',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: const Color(0xff508aa9),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFD4D5D5),
                    hintText: 'Your Email',
                    hintStyle: const TextStyle(color: Color(0xff508aa9)),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Color(0xff508aa9),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Color(0xff508aa9)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                child: TextField(
                  obscureText: _obscure,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFD4D5D5),
                    hintText: 'Your Password',
                    hintStyle: const TextStyle(color: Color(0xff508aa9)),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xff508aa9),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscure = !_obscure;
                          });
                        },
                        icon: Icon(
                          _obscure
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash_fill,
                          color: const Color(0xff508aa9),
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Color(0xff508aa9)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
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
                        builder: (context) => const TeacherHomeScreen()),
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
            ]),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 160.0,
              height: 170.0,
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
