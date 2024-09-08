import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import './schooldashboard/aboutschool.dart' as aboutschool;

Widget searchTextfield() {
  const List<String> _school_list = <String>[
    'Aryaman Vikram Birla',
    'Himalya Public School',
    'Gurunanak public School',
    'Maharishi Vidhya Mandir',
    'DAV public school'
  ];
  return Padding(
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
          // Handle the selected suggestion
          // Navigator.of(context as BuildContext).push<void>(
          //   MaterialPageRoute(
          //     builder: (context) => aboutschool.AboutMySchool(suggestion),
          //   ),
          // );
        },
        suggestionsCallback: (pattern) async {
          return _school_list
              .where((suggestion) =>
                  suggestion.toLowerCase().contains(pattern.toLowerCase()))
              .toList();
        },
      ),
    )),
  );
}
