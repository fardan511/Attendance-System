// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:lms/Student_Dashboard/Student_dashboard.dart';
// import 'package:lms/Student_Dashboard/student_profile.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsWidget extends StatelessWidget {
  final Map<String, dynamic> userData;

  const ContactUsWidget({super.key, required this.userData});

  Future<void> _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'attendancemanagement81@gmail.com',
      // queryParameters: {'subject': 'Write Your Subject'},
    );

    try {
      await launch(emailLaunchUri.toString());
    } catch (e) {
      // ignore: avoid_print
      print('Error launching email client: $e');
    }
  }

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
            'Contact Us',
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Text(
                  'If you have any questions or feedback, \nplease feel free to contact us via email.',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 30),
                Container(
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 52, 99, 133),
                        Color.fromARGB(255, 67, 133, 179),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: _sendEmail,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: Text(
                      'Send Email',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
