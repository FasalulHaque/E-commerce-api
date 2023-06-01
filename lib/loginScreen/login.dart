import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bottomNavigationBar/bottomNavigationBar.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.69, top: height * 0.18),
            child: Text(
              'Login',
              style:
                  GoogleFonts.abel(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: height * 0.06,
          ),
          textFieldS(width, height, 'UserName', const Icon(Icons.person)),
          textFieldS(width, height, 'Password', const Icon(Icons.lock_open)),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.15, right: width * 0.13, top: height * 0.06),
            child: SizedBox(
                height: height * 0.06,
                width: width * 0.60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11)),
                    backgroundColor:
                        const Color.fromARGB(255, 61, 147, 232).withOpacity(0.7),
                  ),
                  child: Text(
                    'SUBMIT',
                    style: GoogleFonts.abel(
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Padding textFieldS(double width, double height, String text, Icon icon) {
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.12, right: width * 0.12, top: height * 0.03),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
                width: 1,
                color:
                    const Color.fromARGB(255, 142, 131, 131).withOpacity(0.6)),
          ),
          hintText: text,
          hintStyle: GoogleFonts.abel(
              color: Colors.black.withOpacity(0.7),
              letterSpacing: 1.2,
              fontSize: 14),
          prefixIcon: icon,
          prefixIconColor: Colors.black.withOpacity(0.7),
        ),
      ),
    );
  }
}
