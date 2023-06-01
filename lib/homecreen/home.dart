import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/fetch.dart';
import '../api/model.dart';
import 'details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Products>> futureProducts;
  @override
  void initState() {
    super.initState();
    futureProducts = ProductRepo().fetchProduct();
  }

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
            'Home',
            style: GoogleFonts.abel(color: Colors.white),
          ),
        ),
      ),
      body: FutureBuilder<List<Products>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var productData = snapshot.data;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 5, mainAxisExtent: 220),
              itemCount: productData!.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Details(pro: productData[index]),
                          ));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.02,
                              right: width * 0.02,
                              top: height * 0.02),
                          child: Container(
                            height: height * 0.22,
                            width: width * 0.48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color.fromARGB(255, 46, 58, 80),
                                )),
                            child: Center(
                              child: Image.network(
                                productData[index].image!,
                                width: width * 0.35,
                                height: height * 0.15,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          productData[index].category.toString(),
                          style: GoogleFonts.abel(fontSize: 13),
                        )
                      ],
                    ));
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
