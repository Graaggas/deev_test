import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/rendering.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

void getPanelPosition(double x, BuildContext context) async {
  print("x = $x");
  if (x == 1.0) {
    await Flushbar(
      duration: Duration(seconds: 1),
      title: "Предельное значение!",
      message: "Край экрана достигнут",
      // message:"Желаемый веc",
    ).show(context);
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugRepaintRainbowEnabled = true;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Center(
              child: SvgPicture.asset(
                'assets/circle.svg',
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.black,
              ),
            ),
            SlidingUpPanel(
              backdropEnabled: true,
              onPanelSlide: (x) => getPanelPosition(x, context),
              panelSnapping: false,
              backdropOpacity: 0.0,
              maxHeight: MediaQuery.of(context).size.height,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
              collapsed: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    "This is the collapsed Widget",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              panel: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Column(
                  children: [
                    Text("1111"),
                    Text("2222"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
