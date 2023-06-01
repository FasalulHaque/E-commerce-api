import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cart/cart.dart';
import '../homecreen/home.dart';
import '../profile/profile.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Home(),
    AddToCart(),
    Profile(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: width * 0.09, right: width * 0.09, bottom: height * 0.02),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            // backgroundColor: const Color.fromARGB(255, 21, 136, 231),
            backgroundColor: const Color.fromARGB(255, 46, 58, 80),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            selectedLabelStyle: GoogleFonts.abel(),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Color.fromARGB(255, 217, 241, 251),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Card',
                backgroundColor: Color.fromARGB(255, 217, 241, 251),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: Color.fromARGB(255, 217, 241, 251),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
