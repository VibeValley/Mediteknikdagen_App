import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mtd_app/mainpage/category/eventscreen.dart';
import 'package:mtd_app/style/colors.dart';


class TestFrame extends StatefulWidget {
  const TestFrame({Key? key}) : super(key: key);

  @override
  State<TestFrame> createState() => _TestFrameViewer();
}


class _TestFrameViewer extends State<TestFrame> {

  @override
  Widget build(BuildContext context) {

      return Expanded(
        flex: 8,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor, width: 2),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: const Text(
                      'PreMTD',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                      ),
                    ),
                  ),
              )
            ]
          )
        ]
      )
    );

  //   return Scaffold(
  //    appBar: AppBar(
  //      title: Text('Hello Flutter'),
  //    ),
  //    body: Center(
  //      child: Text(
  //        'HI',
  //        style: TextStyle(fontSize: 24),
  //      ),
  //    ),
  //  );
  //}
}
}