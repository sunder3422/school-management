import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import './searchbar.dart' as searchbox;
import './schooldashboard/aboutschool.dart' as aboutschool;

class MySchool extends StatefulWidget {
  const MySchool({super.key});

  @override
  State<MySchool> createState() => _MySchoolState();
}

class _MySchoolState extends State<MySchool> {
  static const List<String> _school_list = <String>[
    'Aryaman Vikram Birla',
    'Himalya Public School',
    'Gurunanak public School',
    'Maharishi Vidhya Mandir',
    'DAV public school'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpeg"),
                fit: BoxFit.cover),
          ),
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 10, sigmaY: 10, tileMode: TileMode.clamp),
              child: Center(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Image(
                          image: AssetImage("assets/images/logo.png"),
                          width: 100,
                          height: 100,
                        ),
                        DefaultTextStyle(
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.black),
                          child: Text("""STUDENT\nMANAGEMENT"""),
                        ),
                      ],
                    ),
                    const Image(
                      image: AssetImage("assets/images/school.png"),
                      width: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: (Container(
                        width: 300,
                        alignment: Alignment.center,
                        child: TypeAheadField(
                          builder: (context, controller, focusNode) {
                            return TextField(
                              controller: controller,
                              focusNode: focusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                labelText: 'Enter School Name',
                              ),
                            );
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion),
                            );
                          },
                          onSelected: (suggestion) {
                            print(suggestion);
                            // Handle the selected suggestion
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    aboutschool.AboutMySchool(data: suggestion),
                              ),
                            );
                          },
                          suggestionsCallback: (pattern) async {
                            return _school_list
                                .where((suggestion) => suggestion
                                    .toLowerCase()
                                    .contains(pattern.toLowerCase()))
                                .toList();
                          },
                        ),
                      )),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: TextFormField(
                    //     decoration: const InputDecoration(
                    //         border: OutlineInputBorder(),
                    //         labelText: 'Enter your school name'),
                    //     enableSuggestions: true,
                    //     autofillHints: _school_list,
                    //   ),
                    // )
                    //add school icon
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
