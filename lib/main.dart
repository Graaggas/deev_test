import 'package:deev_test/element/element.dart';
import 'package:deev_test/main/main_page_widget.dart';
import 'package:deev_test/model/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(ContainerCardController(), permanent: true);
    return GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => MainPage(),
        ),
        GetPage(
          name: "/element",
          page: () => ElementPage(),
        ),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
