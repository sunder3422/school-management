import 'package:flutter/material.dart';

class AboutMySchool extends StatefulWidget {
  final String data;
  AboutMySchool({Key? key, required this.data});

  @override
  State<AboutMySchool> createState() => _AboutMySchoolState();
}

class _AboutMySchoolState extends State<AboutMySchool> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.data);
  }
}
