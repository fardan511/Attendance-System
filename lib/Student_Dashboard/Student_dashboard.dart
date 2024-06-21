import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lms/Student_Dashboard/student_profile.dart';
import 'package:lms/Student_Dashboard/student_support.dart';

class StudentDashboard extends StatelessWidget {
  final Map<String, dynamic> userData;

  // ignore: use_super_parameters
  const StudentDashboard({Key? key, required this.userData}) : super(key: key);

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
            'Portal',
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
            SizedBox(
              width: width * 0.95,
              child: Image.asset(
                'img/AttendanceGraph.png',
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
          color: Colors.white,
          activeColor: const Color.fromARGB(255, 81, 154, 193),
          tabBackgroundColor: Colors.blue.shade50,
          padding: const EdgeInsets.all(16),
          gap: 8,
          tabs: [
            GButton(
              icon: Icons.home,
              iconColor: const Color(0xff2f4f60),
              text: "Attendance",
              iconSize: 32,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentDashboard(
                      userData: userData,
                    ),
                  ),
                );
              },
            ),
            GButton(
              icon: Icons.person_2_sharp,
              iconColor: const Color(0xff2f4f60),
              text: "Profile",
              iconSize: 32,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentProfile(
                      userData: userData,
                    ),
                  ),
                );
              },
            ),
            GButton(
              icon: Icons.contact_support_rounded,
              iconColor: const Color(0xff2f4f60),
              text: "Support",
              iconSize: 32,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactUsWidget(
                      userData: userData,
                    ),
                  ),
                );
              },
            ),
            GButton(
              icon: Icons.logout_rounded,
              iconColor: const Color(0xff2f4f60),
              text: "Logout",
              iconSize: 32,
              onPressed: () {
                // Perform logout
              },
            ),
          ],
        ),
      ),
    );
  }
}








// import 'dart:convert';
// import 'package:flutter/material.dart';

// class StudentDashboard extends StatelessWidget {
//   final Map<String, dynamic> userData;

//   // ignore: use_super_parameters
//   const StudentDashboard({Key? key, required this.userData}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Student Dashboard'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: MemoryImage(
//                 base64.decode(userData['profilePicture']),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text('Fullname: ${userData['fullname']}'),
//             Text('Email: ${userData['email']}'),
//             Text('Registration No: ${userData['registrationNo']}'),
//             Text('Batch No: ${userData['batchNo']}'),
//             Text('Department: ${userData['department']}'),
//             Text('Role: ${userData['role']}'),
//           ],
//         ),
//       ),
//     );
//   }
// }


