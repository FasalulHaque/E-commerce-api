import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 58, 80),
        title: Padding(
          padding: EdgeInsets.only(left: width * 0.05),
          child: Text(
            'Profile',
            style: GoogleFonts.abel(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.04),
              child: const CircleAvatar(
                radius: 36,
                child: Center(
                    child: Icon(
                  Icons.person,
                  size: 49,
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.11, right: width * 0.11, top: height * 0.04),
              child: Material(
                borderRadius: BorderRadius.circular(13),
                elevation: 4,
                color: Colors.black,
                shadowColor: Colors.black,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 217, 241, 251),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color.fromARGB(255, 217, 241, 251),
                        ),
                      ),
                      hintText: 'Name',
                      hintStyle: GoogleFonts.abel(
                          color: Colors.black,
                          letterSpacing: 1.2,
                          fontSize: 14),
                      filled: true,
                      // fillColor: const Color.fromARGB(255, 217, 241, 251),
                      fillColor: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.11, right: width * 0.11, top: height * 0.02),
              child: Material(
                borderRadius: BorderRadius.circular(13),
                elevation: 4,
                color: Colors.black,
                child: TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 217, 241, 251),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color.fromARGB(255, 217, 241, 251),
                        ),
                      ),
                      hintText: 'Address',
                      hintStyle: GoogleFonts.abel(
                          color: Colors.black,
                          letterSpacing: 1.2,
                          fontSize: 14),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.11, right: width * 0.11, top: height * 0.02),
              child: Material(
                borderRadius: BorderRadius.circular(13),
                elevation: 4,
                color: Colors.black,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 217, 241, 251),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color.fromARGB(255, 217, 241, 251),
                        ),
                      ),
                      hintText: 'Mobile Number',
                      hintStyle: GoogleFonts.abel(
                          color: Colors.black,
                          letterSpacing: 1.2,
                          fontSize: 14),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.11, right: width * 0.11, top: height * 0.02),
              child: Material(
                borderRadius: BorderRadius.circular(13),
                elevation: 4,
                color: Colors.black,
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 217, 241, 251),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color.fromARGB(255, 217, 241, 251),
                        ),
                      ),
                      hintText: 'Email',
                      hintStyle: GoogleFonts.abel(
                          color: Colors.black,
                          letterSpacing: 1.2,
                          fontSize: 14),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.15, right: width * 0.13, top: height * 0.03),
              child: SizedBox(
                  height: height * 0.07,
                  width: width * 0.7,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => OtpScreen(),
                      //     ));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11)),
                      backgroundColor: const Color.fromARGB(255, 61, 147, 232)
                          .withOpacity(0.7),
                    ),
                    child: Text(
                      'UPDATE',
                      style: GoogleFonts.abel(
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
