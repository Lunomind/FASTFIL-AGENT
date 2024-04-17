import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  const CustomText({Key? key, required this.text, this.size, this.color, this.weight}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: GoogleFonts.montserrat(
        fontSize: size ?? 16, color: color,
        fontWeight: FontWeight.w700),
    );
  }
}
