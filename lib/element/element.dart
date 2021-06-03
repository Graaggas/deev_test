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
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

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

    int index = controllerGetx.index;
    print("length = ${controllerGetx.length}");
    int length = controllerGetx.length + 1;

    Pattern regPattern = r'[0-2]';
    RegExp regExp = new RegExp(regPattern);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: textController,
                  autofocus: true,
                  focusNode: focusNode,
                  inputFormatters: [
                    // FilteringTextInputFormatter.allow(RegExp(regPattern)),
                    // LengthLimitingTextInputFormatter(length),
                  ],
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Введите значение";
                    }
                    if (regExp.hasMatch(value)) {
                      print("value = $value");
                      print("reg = ${regExp.pattern}");
                      return null;
                    } else {
                      return ("Неверное значение");
                    }
                  },
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
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print("kk");
                }

                FocusScope.of(context).unfocus();
                controllerGetx.updateCard(index);
                Get.offAllNamed("/");
              },
              child: Text("SAVE"),
            ),
          ],
        ),
      ),
    );
  }
}
