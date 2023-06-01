import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_kiebot/cart/cart.dart';

import '../api/model.dart';
import '../database/db.dart';
import '../database/model.dart';

class Details extends StatefulWidget {
  Details({super.key, required this.pro});
  Products pro;

  @override
  State<Details> createState() => _DetailsState();
}

int cardId = 1;

class _DetailsState extends State<Details> {
  bool _obsecuretick = true;
  void _toggle() {
    setState(() {
      _obsecuretick = !_obsecuretick;
    });
  }

  @override
  Widget build(BuildContext context) {
    void getMaxEmpIdd() {
      final database = $FloorAppDatabase.databaseBuilder('cardDb.db').build();
      database.then((value) {
        value.todoDeo.getMaxId().then((val) {
          if (val != null) {
            setState(() {
              cardId = val.id + 1;
            });
          }
        });
      });
    }

    @override
    void initState() {
      super.initState();
      getMaxEmpIdd();
    }

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
        ),
        body: ListView(
          children: [
            SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.80),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Text(widget.pro.rating!.rate.toString())
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.28,
                    width: width * 1,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Image.network(widget.pro.image!),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Text(
                    widget.pro.title!,
                    style: GoogleFonts.anekTelugu(),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.76),
                    child: Text(
                      'Description',
                      style: GoogleFonts.abel(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width * 0.06, top: height * 0.03),
                    child: Text(
                      widget.pro.description!,
                      style: GoogleFonts.anekTelugu(),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width * 0.03, top: height * 0.03),
                    child: Row(
                      children: [
                        Text(
                          'Price : ',
                          style: GoogleFonts.abel(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Icon(
                          Icons.currency_rupee_sharp,
                          size: 14,
                          color: Colors.red,
                        ),
                        Text(
                          widget.pro.price.toString(),
                          style: GoogleFonts.abel(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.06,
                    top: height * 0.05,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      save();
                      _toggle();
                    },
                    child: Container(
                      height: height * 0.06,
                      width: width * 0.16,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.blue)),
                      child: Center(
                        child: Icon(
                          _obsecuretick
                              ? Icons.shopping_cart_outlined
                              : Icons.remove_shopping_cart_outlined,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.05,
                    left: width * 0.04,
                  ),
                  child: SizedBox(
                    height: height * 0.06,
                    width: width * 0.66,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue.withOpacity(0.6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                        child: Text(
                          'BUY NOW',
                          style: GoogleFonts.actor(fontSize: 14),
                        )),
                  ),
                ),
              ],
            )
          ],
        ));
  }

  save() {
    final database = $FloorAppDatabase.databaseBuilder('cardDb.db').build();
    database.then((value) {
      value.todoDeo.insertCard(CardDb(
          int.parse(widget.pro.id.toString()),
          widget.pro.title.toString(),
          widget.pro.price.toString(),
          widget.pro.description.toString(),
          widget.pro.category.toString(),
          widget.pro.image.toString()));
    });
  }
}
