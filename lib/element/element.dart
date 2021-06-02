import 'package:deev_test/model/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ElementPage extends StatefulWidget {
  const ElementPage({Key key}) : super(key: key);

  @override
  _ElementPageState createState() => _ElementPageState();
}

class _ElementPageState extends State<ElementPage> {
  FocusNode focusNode;
  final textController = TextEditingController();

  @override
  void initState() {
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ContainerCardController controllerGetx = Get.find();
    textController.text = controllerGetx.getIndex().toString();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextFormField(
                controller: textController,
                autofocus: true,
                focusNode: focusNode,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r"^\d+\.?\d{0,1}")),
                  LengthLimitingTextInputFormatter(2),
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0),
                  ),
                  focusColor: Colors.blue,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: Colors.green[300],
                  filled: true,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("SAVE"),
            ),
          ],
        ),
      ),
    );
  }
}
