import 'package:flutter/material.dart';

Widget appFeatures(String imagepath, String text, Color cl) {
  return Center(
    child: (Column(
      children: [
        Image(
          image: AssetImage(imagepath),
          width: 60,
          height: 60,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          width: 90,
          decoration: BoxDecoration(
            color: cl,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 8,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    )),
  );
}
