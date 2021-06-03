import 'package:another_flushbar/flushbar.dart';
import 'package:deev_test/main/containers.dart';
import 'package:deev_test/model/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = new ScrollController();
    super.initState();
  }

  void getPanelPosition(double x, BuildContext context,
      ContainerCardController controller) async {
    print("x = $x");
    // setState(() {
    //   angle = x;
    // });

    controller.setAngle(x);
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

    for (int i = 0; i < listContainers.length; i++) {
      if (i == controllerGetx.getIndex()) {
        _scrollController.animateTo(i * 70.0,
            duration: new Duration(seconds: 2), curve: Curves.ease);
        break;
      }
    }

    // debugRepaintRainbowEnabled = true;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 2,
                child: Obx(
                  () => Transform.rotate(
                    angle: math.pi * controllerGetx.angle.value,
                    child: SvgPicture.asset(
                      'assets/circle.svg',
                      width: 300,
                      height: 300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SlidingUpPanel(
              backdropEnabled: false,
              backdropTapClosesPanel: false,
              parallaxEnabled: true,
              parallaxOffset: 1.0,
              onPanelSlide: (x) => getPanelPosition(x, context, controllerGetx),
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
                          controller: _scrollController,
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
