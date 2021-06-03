import 'package:deev_test/element/element.dart';
import 'package:deev_test/main/containers.dart';
import 'package:deev_test/main/panel.dart';
import 'package:deev_test/model/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:math' as math;

import 'package:sliding_up_panel/sliding_up_panel.dart';

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
    ContainerCardController controllerGetx = Get.find();
    var listContainers = controllerGetx.listContainer;
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
            SlidingUpPanel(
              backdropEnabled: false,
              backdropTapClosesPanel: false,
              parallaxEnabled: true,
              parallaxOffset: 1.0,
              onPanelSlide: (x) => getPanelPosition(x, context),
              panelSnapping: false,
              backdropOpacity: 0.0,
              maxHeight: MediaQuery.of(context).size.height,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
              panel: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildContainerWithBorder(width: 250),
                    buildContainerWithBorder(width: 350),
                    buildContainerWithBorder(width: 150),
                    Container(
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listContainers.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Card(
                                color: listContainers[index].color,
                                child: InkWell(
                                  onTap: () {
                                    controllerGetx.setIndex(index);
                                    Get.toNamed("/element");
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 60,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
