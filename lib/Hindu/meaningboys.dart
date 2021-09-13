import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:naamkaran/model/boysApi.dart';

class MeaningBoys extends StatefulWidget {
  final List<PersonResponse> personArr;

  final PersonResponse? selectedPerson;
  const MeaningBoys({Key? key, required this.personArr, this.selectedPerson})
      : super(key: key);

  @override
  _MeaningBoysState createState() => _MeaningBoysState();
}

class _MeaningBoysState extends State<MeaningBoys> {

  dynamic listImagesnotFound = [
    "images/70710-fox-animation.json",
    "images/71454-waving-girls.json",
    "images/71656-crystal-ball-pink.json",
    "images/72804-power-sticker.json",
    "images/72924-covid-mother-and-baby.json",
    "images/73681-like-animation.json"
        "images/74216-animated-flames.json"
        "images/74254-beiqi-video-loading.json"
  ];
  late Random rnd;
  Widget img() {
    int min = 0;
    int max = listImagesnotFound.length - 1;
    rnd = new Random();
    int r = min + rnd.nextInt(max - min);
    String image_name = listImagesnotFound[r].toString();
    return Lottie.asset(image_name);

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white24,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Names ",
                style: TextStyle(color: Colors.red),
              ),
              Text(
                "Meaning",
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  img(),
                  Text(
                    "${widget.selectedPerson?.meaning}",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
