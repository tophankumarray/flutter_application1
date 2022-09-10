
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:screenshot/screenshot.dart';


// ignore: use_key_in_widget_constructors
class ScreenPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ScreenPageState createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
   ScreenshotController screenshotController = ScreenshotController();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(icon:const Icon(Icons.arrow_back_ios_rounded,size: 17),
        onPressed: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage() ));
        },
        ),
      ),

      // body: Column(children: [
      //   Container( 
      //     height: 50,
      //     width: 100,
      //     margin:  const EdgeInsets.only(top:50,left: 150),
      //     decoration: BoxDecoration(
      //           color: Colors.red, borderRadius: BorderRadius.circular(15)),
      //     child: const Center(child: Text("ABCD")),
      //   ),
      //   const Expanded(
      //     child: SizedBox(
      //       height: 200,
      //     ),
      //   ),
      //   Container(
      //     height: 200,
      //     width: 200,
      //     margin: const EdgeInsets.only(top: 50,left: 150),
      //     decoration: BoxDecoration(
      //       color: Colors.red, borderRadius: BorderRadius.circular(15)),
      //       child: Expanded(child: Image.asset("image/c.png",
      //        height: 60,
      //        width: 60,
      //       )
      //       ),
      //   ),
      // ],),

      body:Stack(children: [
        Screenshot(
           controller: screenshotController,
          child: Container(width: double.infinity,
          height: 250,
          color: Colors.yellow,
          ),
        ),
        Center(
          child: ClipRRect(
           borderRadius: BorderRadius.circular(75),
            child: Image.asset("image/c.png",
                    height: 100,
                    width: 100,
                    ),
          ),
        ),
        //  Padding(padding: EdgeInsets.only(top: 280,left: 30),
        // child: Text("Quinoa Fruit Salad",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        // ),
        // Row(children: const [
        //   Padding(
        //     padding:  EdgeInsets.only(top: 320,left: 30),
        //                    child:  Icon(Icons.do_disturb_on_outlined,size: 35,),
        //                     ),
        //   Padding(
        //     padding:  EdgeInsets.only(top: 320,left: 10),
        //                    child:  Text("1",style: TextStyle(fontSize: 25),)
        //                     ),
        //   Padding(
        //     padding:  EdgeInsets.only(top: 320,left: 10),
        //                    child:  Icon(Icons.add_circle_outline_outlined,size: 35,color: Colors.orange,),
        //                     ),
        //                      Padding(
        //     padding:  EdgeInsets.only(top: 320,left: 120),
        //                    child:  Text("Rs. 2,000",style: TextStyle(fontSize: 25),)
        //                     ),            
        // ],),
        // Container(
        //   margin: const EdgeInsets.only(top: 380),
        //   child: const Divider(color: Colors.grey,),
        // ),
        // const Padding(
        //   padding: EdgeInsets.only(top: 410,left: 30),
        //   child: Text("One Pack Contains:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
        //   ),
        //   const Padding(
        //   padding: EdgeInsets.only(top: 440,left: 30),
        //   child: Text("Red Quinoa, Lime, Honey, Blueberries,Strawberries,Mango,Fresh mint.",style: TextStyle(fontSize: 15),),
        //   ),
        //    Container(
        //   margin: const EdgeInsets.only(top: 490),
        //   child: const Divider(color: Colors.grey,),
        // ),
        // const Padding(
        //   padding: EdgeInsets.only(top: 520,left: 30),
        //   child: Text("If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make",style: TextStyle(fontSize: 15),),
        //   ),
          // Row(
          //   children:  [
          //      const Padding(
          //   padding:  EdgeInsets.only(top: 700,left: 30),
          //                  child: Icon(Icons.favorite_border,size: 35,color: Colors.orange,), 
          //                   ),
          //                    Container(
          //                     margin: const EdgeInsets.only(top: 700,left: 160),
          //               height: 50,
          //               width: 150,
          //               decoration: BoxDecoration(
          //                   color: Colors.orange,
          //                 borderRadius: BorderRadius.circular(10.0),
          //               ),
          //               child:  const Center(
          //                 child: Text("Add to basket",style: TextStyle(color: Colors.white,fontSize: 16),),
          //               ),
          //             ),
          //   ], 
          // ),
      ],),
    );
  }
  }