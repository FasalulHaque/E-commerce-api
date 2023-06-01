import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_kiebot/homecreen/details.dart';

import '../database/db.dart';
import '../database/deo.dart';
import '../database/model.dart';

class AddToCart extends StatefulWidget {
  AddToCart({
    super.key,
  });

  @override
  State<AddToCart> createState() => _AddToCardState();
}

class _AddToCardState extends State<AddToCart> {
  CardDao? _carddDao;

  final database = $FloorAppDatabase.databaseBuilder('cardDb.db').build();
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
              'Cart',
              style: GoogleFonts.abel(color: Colors.white),
            ),
          ),
        ),
        body: FutureBuilder(
            future: _cartData(),
            builder: (BuildContext context, AsyncSnapshot<CardDao> snapshot) {
              if (!snapshot.hasData ||
                  snapshot.connectionState == ConnectionState.none) {
                return const CircularProgressIndicator();
              } else {
                return StreamBuilder(
                    stream: snapshot.data!.streameData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<CardDb>> snapshot) {
                      if (!snapshot.hasData ||
                          snapshot.connectionState == ConnectionState.none) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (snapshot.data!.isEmpty) {
                          return Center(
                              child: Text(
                            'No Data Found',
                            style: GoogleFonts.abel(),
                          ));
                        }
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: height * 0.02, left: width * 0.06),
                                    child: Stack(children: [
                                      Container(
                                        height: height * 0.16,
                                        width: width * 0.88,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 46, 58, 80),
                                            )),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: width * 0.03,
                                                      top: height * 0.01),
                                                  child: Image.network(
                                                    snapshot.data![index].image
                                                        .toString(),
                                                    height: height * 0.13,
                                                    width: width * 0.33,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: width * 0.03),
                                                  child: Text(
                                                    snapshot
                                                        .data![index].category
                                                        .toString(),
                                                    style: GoogleFonts.abel(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: height * 0.12,
                                                left: width * 0.59),
                                            child: const Icon(
                                              Icons.currency_rupee_rounded,
                                              size: 17,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: height * 0.12,
                                            ),
                                            child: Text(
                                              snapshot.data![index].price,
                                              style: GoogleFonts.abel(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue,
                                                  fontSize: 15),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: width * 0.73,
                                            top: height * 0.10),
                                        child: IconButton(
                                            onPressed: () {
                                              deleteTask(
                                                  snapshot.data![index].id);
                                            },
                                            icon: const Icon(
                                              Icons.delete_outline,
                                              size: 22,
                                              color: Colors.black,
                                            )),
                                      ),
                                    ]),
                                  ),
                                ],
                              );
                            });
                      }
                    });
              }
            }));
  }

  Future<CardDao> _cartData() async {
    AppDatabase appdatabase = await database;
    _carddDao = appdatabase.todoDeo;
    return appdatabase.todoDeo;
  }

  void deleteTask(int id) {
    _carddDao!.deleteCard(id);
    setState(() {});
  }
}
