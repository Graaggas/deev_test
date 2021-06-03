import 'package:deev_test/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerCardController extends GetxController {
  var tappedIndex = 0.obs;

  List<ContainerCard> _listContainers = [
    ContainerCard(color: Colors.grey),
    ContainerCard(color: Colors.grey),
    ContainerCard(color: Colors.grey),
    ContainerCard(color: Colors.grey),
    ContainerCard(color: Colors.grey),
    ContainerCard(color: Colors.grey),
    ContainerCard(color: Colors.grey),
    ContainerCard(color: Colors.grey),
    ContainerCard(color: Colors.grey),
  ];

  int getIndex() {
    var resp = tappedIndex.value;
    return resp;
  }

  void setIndex(int index) {
    tappedIndex.value = index;
    update();
  }

  void updateCard(int index) {
    _listContainers[index].color = Colors.red;
    update();
  }

  List<ContainerCard> get listContainer => _listContainers;

  int get index => tappedIndex.value;

  int get length => _listContainers.length;
}
