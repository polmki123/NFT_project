import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Button(
    {required String text, required Function onTap, required IconData icon}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Container(
      decoration: BoxDecoration(
        color: Color(0xFFffe125),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          bottom: 10.0,
          right: 10.0,
          top: 10.0,
        ),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 10.0,
            ),
            Text(
              text,
              style: GoogleFonts.teko(
                fontSize: 16.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
