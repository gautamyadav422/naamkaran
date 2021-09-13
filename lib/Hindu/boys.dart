import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:naamkaran/Hindu/meaningboys.dart';
import 'package:naamkaran/comman.dart';
import 'package:naamkaran/model/boysApi.dart';

class BoysPage1 extends StatefulWidget {
  const BoysPage1({Key? key}) : super(key: key);

  @override
  _BoysPage1State createState() => _BoysPage1State();
}

class _BoysPage1State extends State<BoysPage1> {
  List<PersonResponse> personArr = [];
  bool isLoading = true;
  hinduBoysAPi() async {
    print("Hello-----${Comman.CategoryId}");
    var response = await http.get(Uri.parse(
        "http://mapi.trycatchtech.com/v1/naamkaran/post_list_by_cat_and_gender?category_id=${Comman.CategoryId}&gender=${Comman.Categorygender}"));
    print("RESPONSE --> ${response.body}");
    var respArr = json.decode(response.body);

    setState(() {
      for (var item in respArr) {
        personArr.add(PersonResponse.fromJson(item));
        isLoading = false;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hinduBoysAPi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Names ",
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  "and Meaning",
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(personArr[index].name),
                      trailing: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => MeaningBoys(
                                          personArr: personArr,
                                          selectedPerson: personArr[index],
                                        )));
                          },
                          child: Text("Meaning")),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.black,
                      ),
                  itemCount: personArr.length)),
    );
  }
}
