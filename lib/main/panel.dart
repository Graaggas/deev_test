import 'package:deev_test/element/element.dart';
import 'package:deev_test/main/containers.dart';
import 'package:deev_test/model/controller.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

SlidingUpPanel buildSlidingUpPanel(BuildContext context, Function getPos) {
  ContainerCardController controllerGetx = Get.find();
  var listContainers = controllerGetx.listContainer;
  return SlidingUpPanel(
    backdropEnabled: false,
    backdropTapClosesPanel: false,
    parallaxEnabled: true,
    parallaxOffset: 1.0,
    onPanelSlide: (x) => getPos(x, context),
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
  );
}
