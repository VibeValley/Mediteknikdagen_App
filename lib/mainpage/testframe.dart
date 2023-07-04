import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mtd_app/style/colors.dart';
import '../icons/custom_app_icons.dart';
import 'package:mtd_app/mainpage/companyscreen.dart';
import 'package:mtd_app/models/companies_firebase.dart';

Stream<List<Company>> readCompanyWelcome1() => FirebaseFirestore.instance
    .collection("Companies")
    .orderBy("isHuvudsponsor")
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Company.fromJson(doc.data())).toList());

class TestFrame extends StatefulWidget {
  const TestFrame({Key? key}) : super(key: key);

  @override
  State<TestFrame> createState() => _TestFrameViewer();
}


class _TestFrameViewer extends State<TestFrame> {

  @override
  Widget build(BuildContext context) {

      return Expanded(
        
        child: Center(
          child: Container(
                      //padding:
                      //  const EdgeInsets.only(left: 30, top: 5, right: 30, bottom: 10),
        
            width: 340,
            height: 300,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //color: const Color.fromARGB(255, 236, 246, 255),
              color: const Color.fromARGB(255, 19, 41, 61),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20, right: 190),
                child: Icon(
                  IconWithText.mtd_medtext,
                  color: Colors.white,
                  size: 140,
                ),
              ),
              // ignore: prefer_const_constructors
              const Text(
                'MTD VILL UTBRINGA ETT STORT TACK TILL VÅRA HUVUDSPONSORER!',
                textAlign: TextAlign.center, 
                style: TextStyle(
                  color: Colors.white,
                  //color: Color.fromARGB(255, 236, 102, 17),
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
              ),
              Expanded(
                  
                    child: StreamBuilder<List<Company>>(
                      
                        stream: readCompanyWelcome1(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Text(
                                'Something went wrong!  '); //${snapshot.error}
                          } else if (snapshot.hasData) {
                            var companyss = snapshot.data!;
            
                            companyss.shuffle();
            
                            return GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(
                                  left: 30, top: 5, right: 30, bottom: 20),
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 60,
                                      childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              itemCount:
                                  companyss.length, //snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final currentComp = companyss[index];
            
                                return GestureDetector(onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CompanyScreen(
                                        image: currentComp.image,
                                        name: currentComp.name,
                                        description: currentComp.description,
                                        hasExjobb: currentComp.hasExjobb,
                                        hasSommarjobb:
                                            currentComp.hasSommarjobb,
                                        hasPraktik: currentComp.hasPraktik,
                                        hasTrainee: currentComp.hasTrainee,
                                        hasJobb: currentComp.hasJobb,
                                      ),
                                    ),
                                  );
                                }, child: LayoutBuilder(
                                    builder: (context, constraints) {
                                  if (currentComp.image == "") {
                                    return Container(
                                        alignment: Alignment.center,
                                        // color: Colors.grey.withOpacity(0.2),
                                        child: const Text("hej",
                                            style: TextStyle(fontSize: 12)));
                                  } else {
                                    return Container(
                                        decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            currentComp.image),
                                        //fit: BoxFit.cover,
                                      ),
                                    ));
                                  }
                                }));
                              },
                            );
                          } else {
                            return const Text('Loading...');
                          }
                        })),
            ],
            )
        
          ),
        ),
      );


      //  flex: 8,
      //  child: Column(
      //    mainAxisSize: MainAxisSize.min, 
      //    children: [
      //    Column(
      //      crossAxisAlignment: CrossAxisAlignment.center,
      //      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //      children: [
      //        //InkWell(
      //        //    child: Container(
      //        //      width: 110,
      //        //      decoration: BoxDecoration(
      //        //        border: Border.all(color: mainColor, width: 2),
      //        //        borderRadius: BorderRadius.circular(10),
      //        //        color: Colors.white,
      //        //      ),
      //        //      child: const Text(
      //        //        'PreMTD',
      //        //        textAlign: TextAlign.center,
      //        //        style: TextStyle(
      //        //          fontWeight: FontWeight.w900,
      //        //          fontSize: 15,
      //        //        ),
      //        //      ),
      //        //    ),
      //        //),
      //        InkWell(
      //            child: Container(
      //              //padding:
      //              //  const EdgeInsets.only(left: 30, top: 5, right: 30, bottom: 10),
      //              width: 330,
      //              height: double.infinity,
      //              alignment: Alignment.center,
      //              decoration: BoxDecoration(
      //                borderRadius: BorderRadius.circular(10),
      //                color: const Color.fromARGB(255, 37, 149, 255),
      //                //color: const Color.fromARGB(255, 19, 41, 61),
      //              ),
      //              child: const Column(
      //                mainAxisAlignment: MainAxisAlignment.center,
      //               
      //                children: [
      //                Icon(
      //                  MyFlutterApp.mtd_svart,
      //                  color: mainColor,
      //                  size: 80,
      //                ),
      //                Text(
      //                  'MTD vill utbringa ett stort tack till våra huvudsponsorer',
      //                  textAlign: TextAlign.center,
      //                  style: TextStyle(
      //                    color: Colors.white,
      //                    fontWeight: FontWeight.bold,
      //                    fontSize: 14),
      //                ),
      //              ])
//
      //            ),
      //        )
      //      ]
      //    )
      //  ]
      //)
    //);

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