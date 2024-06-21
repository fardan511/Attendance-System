import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/Screens/Dashboard/attandanceinfo_screen.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  List<String> subjects = [
    "Internet of Things",
    "Object-Oriented Programming",
    "Database Management",
    "Artificial Intelligence",
    "Mobile App Development",
    "Data Structures and Algorithms",
    "Web Development",
    "Network Security",
    "Cloud Computing",
    "Human-Computer Interaction"
  ];
  List<String> percentageList = [
    '70%',
    '10%',
    '20%',
    '50%',
    '25%',
    '80%',
    '15%',
    '45%',
    '30%',
    '60%'
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
                      text: 'Welcome',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: const Color(0xff2f4f60),
                      ),
                    ),
                    TextSpan(
                      text: ' Mr. Tabish Ameen',
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
                'Education is the passport to the future, for tomorrow belongs to those who prepare for it today',
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
                'Registered Subjects',
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
                    itemCount: subjects.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AttendanceInfoScreen(
                                  subjName: subjects[index],
                                  attendancePercentage: percentageList[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Subject: ',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: const Color(0xff2f4f60),
                                          ),
                                        ),
                                        TextSpan(
                                          text: subjects[index],
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: const Color(0xff2f4f60),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Attendance: ',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: const Color(0xff2f4f60),
                                          ),
                                        ),
                                        TextSpan(
                                          text: percentageList[index],
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
