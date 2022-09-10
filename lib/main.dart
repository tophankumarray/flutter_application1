import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/demopage.dart';
import 'package:flutter_application_1/homepage.dart';
import 'screenpage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/dataapipage.dart';

void main()  {runApp( 
  DevicePreview(
    enabled: false,
    // enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ),
);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(bodyText2: TextStyle(fontSize: 15.sp)),
          ),
          home:    HomePage (),
        );
      },
    );
  }
}

