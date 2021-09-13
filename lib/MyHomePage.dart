import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:naamkaran/comman.dart';
import 'package:naamkaran/model/categorynamemodel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CategoryName> cateNameId = [];

  apiCategory() async {
    var rsponse = await http.get(
      Uri.parse("http://mapi.trycatchtech.com/v1/naamkaran/category_list"),
    );
    var respArr = json.decode(rsponse.body);

    setState(() {
      for (var item in respArr) {
        cateNameId.add(
          CategoryName.fromJson(item),
        );
      }
    });
  }

  Widget mainButton({required int indexNo}) {
    return Card(
      elevation: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(78)),
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.height / 5,
        child: ElevatedButton(
          onPressed: () {
            Comman.CategoryId = "${cateNameId[indexNo].id}";
            Comman.CategoryName = "${cateNameId[indexNo].catName}";

            Navigator.of(context).pushNamed('/hindu');
          },
          child: Text(
            cateNameId[indexNo].catName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(24),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiCategory();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Naam",
                style: TextStyle(color: Colors.red),
              ),
              Text(
                "Karan",
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://previews.123rf.com/images/yasyahappy/yasyahappy1705/yasyahappy170500043/78495076-seamless-pattern-from-realistic-pink-pacifiers-baby-bottles-foot-white-background-vector-illustratio.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: cateNameId.length > 0
                ? Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      for (int i = 0; i < cateNameId.length; i++)
                        mainButton(indexNo: i)
                    ],
                  )
                : SizedBox(),
          ),
        ),
      ),
    );
  }

}

