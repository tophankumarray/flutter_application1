import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/RecommendedItems.dart';

import '../dataapipage.dart';

class ItemCatagory extends StatefulWidget {
  //! variables
  String? itemName;
  int? itemprice;

  ItemCatagory({Key? key, @required this.itemName, @required this.itemprice})
      : super(key: key);

  @override
  State<ItemCatagory> createState() => _ItemCatagoryState();
}

class _ItemCatagoryState extends State<ItemCatagory> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: [
          RecomondedCombo(itemName: "Honeyb Lim Combo ", itemprice: 200),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child:
                RecomondedCombo(itemName: "Chowmi eg Combo ", itemprice: 400),
          ),
          RecomondedCombo(itemName: "Eg Chicke Combo", itemprice: 500),
        ],
      ),
    );
  }
}
