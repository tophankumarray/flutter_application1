// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/ItemCatagory.dart';
import 'package:flutter_application_1/Widget/RecommendedItems.dart';
import 'package:flutter_application_1/dataapipage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screenpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    TabController _tabController = TabController(
      length: 4,
      vsync: this,
    );
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Icon(Icons.menu),
              ),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 20, right: 10),
                    child: Icon(
                      Icons.shopping_basket_outlined,
                      color: Colors.orange,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("My basket"),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text("Hello Tony,"),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  "What fruit salad",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 20.w, bottom: 10.h),
            child: const Text(
              "combo do you  want today?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.h,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15)),
                    child: const TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search for fruit salad combos',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                const Icon(Icons.format_list_bulleted),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 25,
              left: 20,
            ),
            child: Text(
              "Recommended Combo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  RecomondedCombo(
                      itemName: "Honeyb Lim Combo ", itemprice: 200),
                  Padding(
                    padding:const  EdgeInsets.symmetric(horizontal: 5.0),
                    child: RecomondedCombo(
                        itemName: "Chowmi eg Combo ", itemprice: 400),
                  ),
                  RecomondedCombo(itemName: "Eg Chicke Combo", itemprice: 500),
                ],
              ),
            ),
          ),

          // ignore: avoid_unnecessary_containers
          Container(
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.orange,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              tabs: const <Widget>[
                Tab(
                  child: Text("Hottest"),
                ),
                Tab(
                  child: Text("Popular"),
                ),
                Tab(
                  child: Text("New combo"),
                ),
                Tab(
                  child: Text("Top"),
                ),
              ],
            ),
          ),
        const  SizedBox(
            height: 10,
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: double.maxFinite,
            height: 215,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ItemCatagory(itemName: "Honeyb Lim Combo ", itemprice: 200),
                ItemCatagory(itemName: "Egg Lim Combo ", itemprice: 400),
                ItemCatagory(itemName: "Chowmin Lim Combo ", itemprice: 600),
                ItemCatagory(itemName: "Yipee Lim Combo ", itemprice: 800),
              ],
            ),
          ),

          Builder(
              builder: (context) => TextButton(
                    child:  Text("button"),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Hello !'),
                      ));
                    },
                  )),
        ],
      ),
    );
  }
}
