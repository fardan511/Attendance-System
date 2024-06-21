import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeacherHomeScreen extends StatefulWidget {
  const TeacherHomeScreen({super.key});

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  List<String> notifications = [
    "New Assignment Posted in Internet of Things",
    "Reminder: Object-Oriented Programming Class Tomorrow",
    "Database Management - Important Update",
    "Explore the World of Artificial Intelligence",
    "Mobile App Development Workshop Announced",
    "Study Session for Data Structures and Algorithms",
    "Web Development Seminar Next Week",
    "Network Security Advisory: Stay Informed",
    "Cloud Computing Discussion Forum Opened",
    "Human-Computer Interaction Survey Request"
  ];
  List<String> dates = [
    '12/19/2023',
    '12/20/2023',
    '12/19/2023',
    '12/20/2023',
    '12/23/2023',
    '12/24/2023',
    '12/25/2023',
    '12/26/2023',
    '12/25/2023',
    '12/26/2023',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Welcome back',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: const Color(0xff2f4f60),
                      ),
                    ),
                    TextSpan(
                      text: ' Prof. Nimra',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 23,
                        color: const Color(0xff508aa9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Text(
                'Education is not the filling of a pail, but the lighting of a fire.',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                  color: const Color(0xff2f4f60),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Recent Notifications',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: const Color(0xff2f4f60),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Color.fromARGB(255, 133, 204, 241)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: notifications.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  notifications[index],
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: const Color(0xff2f4f60),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Date: ',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: const Color(0xff2f4f60),
                                        ),
                                      ),
                                      TextSpan(
                                        text: dates[index],
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          color: const Color(0xff2f4f60),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
