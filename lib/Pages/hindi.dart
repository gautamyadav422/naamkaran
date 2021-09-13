

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:naamkaran/comman.dart';



class BoysPage extends StatefulWidget {


  const BoysPage({
    Key? key,
  }) : super(key: key);

  @override
  _BoysPageState createState() => _BoysPageState();
}

class _BoysPageState extends State<BoysPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to ",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              "${Comman.CategoryName} Family",
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            Lottie.asset('images/64274-baby.json'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.height / 5,
                  child: ElevatedButton(
                    onPressed: () {
                      Comman.Categorygender ="1";
                      // Comman.Categorygender="${cateNameId[indexNo].catName}";
                      Navigator.of(context).pushNamed('/hinduboys');
                    },
                    child: Text(
                      "Boys",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(24),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.height / 5,
                  child: ElevatedButton(
                    onPressed: () {
                      Comman.Categorygender ="2";
                      Navigator.of(context).pushNamed('/hinduboys');
                    },
                    child: Text(
                      "Girls",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(24),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
