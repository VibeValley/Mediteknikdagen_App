import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mtd_app/mainpage/category/eventscreen.dart';
import 'package:mtd_app/style/colors.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  TextEditingController _searchController1 = TextEditingController();
  TextEditingController _searchController2 = TextEditingController();
  TextEditingController _searchController3 = TextEditingController();
  TextEditingController _searchController4 = TextEditingController();
  String searchText1 = '';
  String searchText2 = '';
  String searchText3 = '';
  String searchText4 = '';
  FocusNode field1 = FocusNode();
  FocusNode field2 = FocusNode();
  FocusNode field3 = FocusNode();
  FocusNode field4 = FocusNode();
  bool isEmpty1 = true;
  bool isEmpty2 = true;
  bool isEmpty3 = true;
  bool isEmpty4 = true;
  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
              const SizedBox(
                width: 500,
                child: Padding(
                  padding: EdgeInsets.only(left: 34.0, bottom: 15),
                    child: Text(
                      'Rebus',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                        color: Colors.white,
                      ),
                      
                    ),
                  ),
              ),
              Row(
                children: [
                  
                  Flexible(
                    
                    child: Padding(
                      padding: const EdgeInsets.only(left: 34.5),
                      child: Container(
                        width: 55,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 56, 70, 83),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(children: [
                          TextField(
                            focusNode: field1,
                            controller: _searchController1,
                            onChanged: (value) {
                              FocusScope.of(context).requestFocus(field2);
                              isEmpty1 = false;
                              setState(() {
                                searchText1 = value;
                              });
                            },
                            decoration: InputDecoration(
                              //labelText: "Search",
                              border: InputBorder.none,
                              hoverColor: Colors.grey[200],
                              
                              contentPadding: const EdgeInsets.only(left: 15.0)
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            )
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Flexible(
                    
                    child: Padding(
                      padding: const EdgeInsets.only(left: 34.5),
                      child: Container(
                        width: 55,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 56, 70, 83),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(children: [
                          TextField(
                            focusNode: field2,
                            controller: _searchController2,
                            onChanged: (value) {
                              FocusScope.of(context).requestFocus(field3);
                              isEmpty2 = false;
                              setState(() {
                                searchText2 = value;
                              });
                            },
                            decoration: InputDecoration(
                              //labelText: "Search",
                              border: InputBorder.none,
                              hoverColor: Colors.grey[200],
                              
                              contentPadding: const EdgeInsets.only(left: 15.0)
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            )
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Flexible(
                    
                    child: Padding(
                      padding: const EdgeInsets.only(left: 34.5),
                      child: Container(
                        width: 55,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 56, 70, 83),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(children: [
                          TextField(
                            focusNode: field3,
                            controller: _searchController3,
                            onChanged: (value) {
                              FocusScope.of(context).requestFocus(field4);
                              isEmpty3 = false;
                              setState(() {
                                searchText2 = value;
                              });
                            },
                            decoration: InputDecoration(
                              //labelText: "Search",
                              border: InputBorder.none,
                              hoverColor: Colors.grey[200],
                              
                              contentPadding: const EdgeInsets.only(left: 15.0)
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            )
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Flexible(
                    
                    child: Padding(
                      padding: const EdgeInsets.only(left: 34.5),
                      child: Container(
                        width: 55,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 56, 70, 83),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(children: [
                          TextField(
                            focusNode: field4,
                            controller: _searchController4,
                            onChanged: (value) {
                              FocusScope.of(context).requestFocus(field1);
                              isEmpty4 = false;

                              setState(() {
                                searchText2 = value;
                              });
                            },
                            decoration: InputDecoration(
                              //labelText: "Search",
                              border: InputBorder.none,
                              hoverColor: Colors.grey[200],
                              
                              contentPadding: const EdgeInsets.only(left: 15.0)
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            )
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextButton(
                  
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(326.0,50.0),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))), // Adjust the radius as needed
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(mainColor),
                  ),
                  onPressed: () {
                    if(!isEmpty1 && !isEmpty2 && !isEmpty3 && !isEmpty4){
                      _searchController1.clear();
                      _searchController2.clear();
                      _searchController3.clear();
                      _searchController4.clear();
                    }
                    else{
              
                    }
                  },
                  
                  child: const Text('Lös in'),
                ),
              ),
        ],
        )
    );
  }
}