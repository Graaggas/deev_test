import 'package:flutter/material.dart';

Padding buildContainerWithBorder({double width}) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      height: 40,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.grey[300],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(2, 2), // changes position of shadow
          ),
        ],
      ),
    ),
  );
}
