import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:lms/Student_Dashboard/Student_dashboard.dart';
// import 'package:lms/Student_Dashboard/student_support.dart';

class StudentProfile extends StatelessWidget {
  final Map<String, dynamic> userData;

  // ignore: use_super_parameters
  const StudentProfile({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade100,
        // backgroundColor: const Color(0xff2f4f60),
        title: Padding(
          padding: EdgeInsets.only(left: width * 0.10),
          child: Text(
            'Profile',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              // color: Colors.white,
              color: Colors.black,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: SizedBox(
                      width: width * 0.95,
                      height: 200,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: width * 0.95,
                              color: const Color.fromARGB(255, 52, 99, 133),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(180.0, 50, 0, 0),
                                child: Text(
                                  "${userData['fullname']}",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: width * 0.95,
                              color: Colors.grey.shade200,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(160.0, 15, 0, 0),
                                child: Text(
                                  "${userData['registrationNo']}",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.05,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 15, // Adjust the left position to center the image
                    child: userData['profilePicture'] != null
                        ? ClipOval(
                            child: Image.memory(
                              base64.decode(
                                userData['profilePicture']!,
                              ),
                              height: height * 0.13,
                            ),
                          )
                        : Icon(Icons.person,
                            size: height * 0.13), // Placeholder widget
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: width * 0.95,
                height: height * 0.3,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Full Name',
                              style: GoogleFonts.poppins(
                                color: Colors.blue.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.036,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              // 'Fardan',
                              "${userData['fullname']}",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.036,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Email Address',
                              style: GoogleFonts.poppins(
                                color: Colors.blue.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.036,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              // 'Fardan',
                              "${userData['email']}",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.036,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Registration Number',
                              style: GoogleFonts.poppins(
                                color: Colors.blue.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.036,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              // 'Fardan',
                              "${userData['registrationNo']}",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.036,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Batch No',
                              style: GoogleFonts.poppins(
                                color: Colors.blue.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.036,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              // 'Fardan',
                              "${userData['batchNo']}",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.036,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Department',
                              style: GoogleFonts.poppins(
                                color: Colors.blue.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.036,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              // 'Fardan',
                              "${userData['department']}",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.036,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Role',
                              style: GoogleFonts.poppins(
                                color: Colors.blue.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.036,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              // 'Fardan',
                              "${userData['role']}",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.036,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      //   child: GNav(
      //     color: Colors.white,
      //     activeColor: const Color.fromARGB(255, 81, 154, 193),
      //     tabBackgroundColor: Colors.blue.shade50,
      //     padding: const EdgeInsets.all(16),
      //     gap: 8,
      //     tabs: [
      //       GButton(
      //         icon: Icons.home,
      //         iconColor: const Color(0xff2f4f60),
      //         text: "Attendance",
      //         iconSize: 32,
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => StudentDashboard(
      //                 userData: userData,
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //       GButton(
      //         icon: Icons.person_2_sharp,
      //         iconColor: const Color(0xff2f4f60),
      //         text: "Profile",
      //         iconSize: 32,
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => StudentProfile(
      //                 userData: userData,
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //       GButton(
      //         icon: Icons.contact_support_rounded,
      //         iconColor: const Color(0xff2f4f60),
      //         text: "Support",
      //         iconSize: 32,
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => ContactUsWidget(
      //                 userData: userData,
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //       GButton(
      //         icon: Icons.logout_rounded,
      //         iconColor: const Color(0xff2f4f60),
      //         text: "Logout",
      //         iconSize: 32,
      //         onPressed: () {
      //           // Perform logout
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
