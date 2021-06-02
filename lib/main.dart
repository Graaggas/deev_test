import 'package:deev_test/element/element.dart';
import 'package:deev_test/main/panel.dart';
import 'package:deev_test/model/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/rendering.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

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

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void getPanelPosition(double x, BuildContext context) async {
    print("x = $x");
    setState(() {
      angle = x;
    });
    if (x == 1.0) {
      await Flushbar(
        duration: Duration(seconds: 1),
        title: "Предельное значение!",
        message: "Край экрана достигнут",
        // message:"Желаемый веc",
      ).show(context);
    }
  }

  double angle = 0.1;

  @override
  Widget build(BuildContext context) {
    // debugRepaintRainbowEnabled = true;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Center(
              child: Transform.rotate(
                angle: math.pi * angle,
                child: SvgPicture.asset(
                  'assets/circle.svg',
                  width: 300,
                  height: 300,
                  color: Colors.black,
                ),
              ),
            ),
            buildSlidingUpPanel(context, getPanelPosition),
          ],
        ),
      ),
    );
  }
}
