// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:image_cropper/image_cropper.dart';
import 'package:lms/Dialog_Box/err_dialog.dart';
import 'package:lms/Student_Dashboard/Student_dashboard.dart';
import 'package:path/path.dart' show basename;
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/Screens/Auth/TeacherAuth/teacher_signup.dart';

class StudentSignupScreen extends StatefulWidget {
  const StudentSignupScreen({Key? key}) : super(key: key);

  @override
  State<StudentSignupScreen> createState() => _StudentSignupScreenState();
}

class _StudentSignupScreenState extends State<StudentSignupScreen> {
  // late final Map<String, dynamic> userData;
  final Map<String, dynamic> userData = {};
  File? _image;
  final signUpFormKey = GlobalKey<FormState>();
  bool isStudentloading = false;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _registrationController = TextEditingController();
  final TextEditingController _batchNoController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _getFromCamera() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _cropImage(pickedFile.path);
    }
  }

  void _getFromGallery() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _cropImage(pickedFile.path);
    }
  }

  void _cropImage(filePath) async {
    CroppedFile? croppedImage = await ImageCropper()
        .cropImage(sourcePath: filePath, maxHeight: 1080, maxWidth: 1080);

    if (croppedImage != null) {
      setState(() {
        _image = File(croppedImage.path);
      });
    }
  }

  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Please choose an option',
            style: GoogleFonts.merriweather(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.camera,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Camera",
                      style: GoogleFonts.merriweather(color: Colors.black),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.image,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Gallery",
                      style: GoogleFonts.merriweather(color: Colors.black),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _registerUser(BuildContext context) async {
    final isValid = signUpFormKey.currentState!.validate();
    if (isValid) {
      if (_image == null) {
        showDialog(
          context: context,
          builder: (context) {
            return const ErrorAlertDialog(
              message: 'Please Pick an Image',
            );
          },
        );
        return;
      }

      setState(() {
        isStudentloading = true;
      });

      final Uri url =
          // Uri.parse('https://0e09-61-5-149-30.ngrok-free.app/api/v1/register');
          Uri.parse('http://192.168.100.10:5001/api/v1/register');
      try {
        var request = http.MultipartRequest('POST', url)
          ..fields['role'] = 'student'
          ..fields['fullname'] = _fullNameController.text
          ..fields['email'] = _emailController.text
          ..fields['registration'] = _registrationController.text
          ..fields['batchNo'] = _batchNoController.text
          ..fields['department'] = _departmentController.text
          ..fields['password'] = _passwordController.text
          ..fields['confirmPassword'] = _confirmPasswordController.text
          ..files.add(await http.MultipartFile.fromPath(
            'profilePicture',
            _image!.path,
            filename: basename(_image!.path),
          ));

        var response = await request.send();

        if (response.statusCode == 201) {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => StudentDashboard(
          //       userData: userData,
          //     ),
          //   ),
          // );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentDashboard(
                userData: userData,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registration failed'),
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
      } finally {
        setState(() {
          isStudentloading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 160.0,
                height: 150.0,
                decoration: const BoxDecoration(
                  color: Color(0xff508aa9),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(150),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            SizedBox(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Signup as Student Account! ',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: const Color(0xff508aa9),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Form(
                            key: signUpFormKey,
                            child: Column(
                              children: [
                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      _showImageDialog(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(200),
                                      ),
                                      child: CircleAvatar(
                                        radius: width * 0.1,
                                        backgroundColor: const Color.fromARGB(
                                            255, 226, 223, 223),
                                        backgroundImage: _image == null
                                            ? null
                                            : FileImage(_image!),
                                        child: _image == null
                                            ? Transform.scale(
                                                scale:
                                                    1.2, // Adjust the scale factor as needed
                                                child: const Icon(
                                                  Icons.camera_enhance,
                                                  color: Color(0xff508aa9),
                                                ),
                                              )
                                            : null,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextField(
                            controller: _fullNameController,
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              labelStyle: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TextField(
                            controller: _registrationController,
                            decoration: InputDecoration(
                              labelText: 'Registration No',
                              labelStyle: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TextField(
                            controller: _batchNoController,
                            decoration: InputDecoration(
                              labelText: 'Batch No',
                              labelStyle: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TextField(
                            controller: _departmentController,
                            decoration: InputDecoration(
                              labelText: 'Department',
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
                          TextField(
                            controller: _confirmPasswordController,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              labelStyle: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () => _registerUser(context),
                        child: Container(
                          alignment: Alignment.center,
                          height: 45,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xffE4E6E7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Signup',
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
                    ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Align(
                alignment: Alignment.topRight,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Signup as ',
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
                            // Handle teacher login action
                            print('Student Signup tapped');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TeacherSignupScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
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
      ),
    );
  }
}
