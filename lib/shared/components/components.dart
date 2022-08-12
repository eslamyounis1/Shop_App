//on boarding
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildPage(String image) => Column(
      children: [
        const SizedBox(
          height: 30.0,
        ),
        Container(
          width: 533.33,
          height: 400.0,
          child: Image(
            image: AssetImage(
              image,
            ),
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Track your mood and reflect on your day',
            style: GoogleFonts.leckerliOne(fontSize: 32.0),
          ),
        ),
      ],
    );
