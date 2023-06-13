import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:mtd_app/mainpage/category/map.dart';
import 'package:mtd_app/mainpage/companyscreen.dart';
import 'package:mtd_app/models/companies_firebase.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mtd_app/style/colors.dart';


class testFrame extends StatefulWidget {
  const testFrame({Key? key}) : super(key: key);

  @override
  State<testFrame> createState() => _testFrameViewer();
}


class _testFrameViewer extends State<testFrame> {


  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Hello Flutter'),
      ),
      body: Center(
        child: Text(
          'HI',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}