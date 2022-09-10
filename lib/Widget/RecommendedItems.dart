import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screenpage.dart';

class RecomondedCombo extends StatelessWidget {
//! initilize Variables

  String? itemName;
  int? itemprice;

  RecomondedCombo({Key? key, @required this.itemName, @required this.itemprice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 170.h,
      decoration: BoxDecoration(
          color: Colors.greenAccent, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 100),
            child: Icon(
              Icons.favorite_border_outlined,
              color: Colors.orange,
            ),
          ),
        const  SizedBox(height: 5,),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              child: Image.asset(
                "image/c.png",
                height: 60,
                width: 60,
              ),
            ),
          ),
          // SizedBox(height: 5,),
          SizedBox(height: 5,),

          SizedBox(
            width: 140.w,
            // height: 30.h,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0,vertical: 6),
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                itemName!,
                style: const TextStyle( 
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          // SizedBox(height: 5,),
          Row(
            children: [
              Text(
                "₹ " + itemprice!.toString(),
                style: const TextStyle(
                 
                    color: Colors.orange, overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                // height: 35.h,
                width: 30.w,
                child: FloatingActionButton(
                  onPressed: () {},
                  // ignore: sort_child_properties_last
                  child: const Icon(
                    Icons.add,
                    color: Colors.orange,
                  ),
                  elevation: 3.0,
                  backgroundColor: Colors.orange[100],
                ),
              ),
            ],
          ),
        ],
      ),
    );
 
  }
}
