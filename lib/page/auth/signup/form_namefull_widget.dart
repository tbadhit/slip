import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slip/theme/theme.dart';

class FormNameFull extends StatelessWidget {
  FormNameFull({
    Key? key,
  }) : super(key: key);

  final TextEditingController namefullController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: 43,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      child: Center(
        child: TextFormField(
          controller: namefullController,
          decoration: InputDecoration.collapsed(
            hintText: 'Tulis nama lengkap',
            hintStyle: GoogleFonts.montserrat(
              textStyle: TextStyle(fontSize: 12, fontWeight: coolBold),
            ),
          ),
        ),
      ),
    );
  }
}
