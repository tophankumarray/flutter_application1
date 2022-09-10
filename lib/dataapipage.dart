// ignore_for_file: prefer_if_null_operators

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/modelpage.dart';
import 'package:http/http.dart' as http;

// ignore: use_key_in_widget_constructors
class DataApiPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _DataApiPageState createState() => _DataApiPageState();
}

class _DataApiPageState extends State<DataApiPage> {
  modelpage? modelData;

//  GET MODEL PAGE

  Future<modelpage> getModelpageData() async {
    var url =
        "https://oodw3ely8i.execute-api.ap-south-1.amazonaws.com/development/api/getdata";
    final headers = {"Content-type": "application/json"};
    final http.Response response = await http.post(Uri.parse(url),
        headers: headers,
        body: json.encode({
          "api_name": "IPO_LISTING",
          "parameters": {"ipo_type": "L", "pagenumber": "1", "pagesize": "10"}
        }));

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        modelData = modelpage.fromJson(data);
        setState(() {});
      }
    } catch (e) {
      print("failed to load data");
    }
    return modelData!;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getModelpageData();
  }

  @override
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  Widget build(BuildContext) {
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: const Center(
            child: Text('User Data'),
            ),
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: modelData == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                height: double.infinity,
                width: 400,
                child: Card(
                  color: Colors.white,
                  child: ListView.builder(
                    // ignore: unnecessary_null_comparison
                    itemCount: modelData!.data.length == null
                        ? 0
                        : modelData!.data.length,
                    itemBuilder: (context, int index) {
                      var issuePriceInt =
                          double.parse(modelData!.data[index].issueprice);
                      // var issuePriceInt = double.parse("642.0000");
                      // ignore: avoid_print
                      // print(issuePriceInt);
                      var dayChangeInt =
                          double.parse(modelData!.data[index].dayChange);
                      // ignore: avoid_print
                      // print(dayChangeInt);
                      var changeperInt =
                          double.parse(modelData!.data[index].changeper);
                      // print(changeperInt);
                      var listpriceInt =
                          double.parse(modelData!.data[index].listprice);
                      // print(listpriceInt);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                child: Image.network(
                                  "https://d1tymi9mhi46bx.cloudfront.net/cmot-logos/${modelData!.data[index].filename.toString()}",
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              modelData == null
                                  ? const Text(" - ")
                                  : Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, left: 30),
                                      child: Text(
                                        modelData!.data[index].compname
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                            ],
                          ),
                          modelData == null
                              ? const Text(" - ")
                              : Container(
                                  margin: const EdgeInsets.only(left: 80),
                                  child: Text(
                                    modelData!.data[index].issuetype.toString(),
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ),
                          Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 30, left: 14),
                                child: Text(
                                  // ignore: unnecessary_string_interpolations
                                  "${(issuePriceInt).toStringAsFixed(0)}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 30, left: 10),
                                child:modelData!.data[index].dayChange
                                              .toString()
                                              .contains('-') ? Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  (" (${(dayChangeInt).toStringAsFixed(2)} )") ): Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  ("   ( +${ (dayChangeInt).toStringAsFixed(2)} )") ,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color:   modelData!.data[index].dayChange
                                              .toString()
                                              .contains('')
                                          ? Colors.red
                                          
                                         :Colors.green),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 30, left: 10),
                                child: Text(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    //  "("+modelData!.data[index].changeper.toString()+")",
                                    (" (${(changeperInt).toStringAsFixed(2)} )"),
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: modelData!.data[index].dayChange
                                                .toString()
                                                .contains('-')
                                            ? Colors.red
                                            : Colors.green)),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 10, left: 15),
                                child: const Text(
                                  'Exchange:',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ),
                              modelData == null
                                  ? const Text(" - ")
                                  : Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, left: 2),
                                      child: Text(
                                        modelData!.data[index].exchange
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.orange),
                                      ),
                                    ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 10, left: 20),
                                child: const Text(
                                  'Industry:',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ),
                              modelData == null
                                  ? const Text(" - ")
                                  : Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, left: 2),
                                      child: Text(
                                        modelData!.data[index].industryName
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.orange),
                                      ),
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 50, left: 15),
                                child: const Text(
                                  'Offer Price(₹)',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 50, left: 20),
                                child: const Text(
                                  'Listing Price(₹)',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 50, left: 48),
                                child: const Text(
                                  'Listing date',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 8, left: 17),
                                child: Text(
                                  modelData!.data[index].listpriceChangePer
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              modelData == null
                                  ? const Text(" - ")
                                  : Container(
                                      margin: const EdgeInsets.only(
                                          top: 8, left: 70),
                                      child: Text(
                                        // modelData!.data[index].listprice.toString(),
                                        (" ${(listpriceInt).toStringAsFixed(2)} "),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                              Container(
                                margin: const EdgeInsets.only(top: 8, left: 5),
                                child: Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  "(" +
                                      modelData!.data[index].listpriceChangePer
                                          .toString() +
                                      ")",
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.green),
                                ),
                              ),
                              modelData == null
                                  ? const Text(" - ")
                                  : Container(
                                      margin: const EdgeInsets.only(
                                          top: 8, left: 22),
                                      child: Text(
                                        modelData!.data[index].listdate
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 18, bottom: 10),
                                child: Text(
                                  modelData!.data[index].sincelistingPer
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.green),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 10, bottom: 10),
                                child: const Text(
                                  'Since Listing ',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 40, bottom: 10),
                                child: Text(
                                  modelData!.data[index].mktLot.toString(),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 5, bottom: 10),
                                child: const Text(
                                  'Subscribed ',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // ignore: avoid_unnecessary_containers
                          Container(
                            child: const Divider(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
