import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendanceInfoScreen extends StatefulWidget {
  AttendanceInfoScreen(
      {super.key, required this.subjName, required this.attendancePercentage});
  String subjName;
  String attendancePercentage;

  @override
  State<AttendanceInfoScreen> createState() => _AttendanceInfoScreenState();
}

class _AttendanceInfoScreenState extends State<AttendanceInfoScreen> {
  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  List<String> dates = [
    '12/19/2023',
    '12/20/2023',
    '12/21/2023',
    '12/22/2023',
    '12/23/2023',
    '12/24/2023',
    '12/25/2023',
    '12/26/2023',
    '12/27/2023',
    '12/28/2023',
    '12/29/2023',
    '12/30/2023',
    '12/31/2023',
    '01/01/2024',
    '01/02/2024',
    '01/03/2024',
    '01/04/2024',
    '01/05/2024',
    '01/06/2024',
    '01/07/2024'
  ];
  List<String> status = [
    'Present',
    'Absent',
    'Present',
    'Present',
    'Absent',
    'Present',
    'Absent',
    'Present',
    'Present',
    'Absent',
    'Present',
    'Absent',
    'Present',
    'Present',
    'Absent',
    'Present',
    'Absent',
    'Present',
    'Present',
    'Absent'
  ];
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                widget.subjName,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: const Color(0xff2f4f60),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Attendance Percentage: ',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: const Color(0xff2f4f60),
                      ),
                    ),
                    TextSpan(
                      text: widget.attendancePercentage,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: const Color(0xff508aa9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Attendance Record',
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
                    itemCount: daysOfWeek.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  dates[index],
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xff508aa9),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      daysOfWeek[index],
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff508aa9),
                                      ),
                                    ),
                                    Text(
                                      status[index],
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff508aa9),
                                      ),
                                    )
                                  ],
                                )
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
