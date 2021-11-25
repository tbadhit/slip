import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slip/theme/theme.dart';

class FormEmail extends StatelessWidget {
  FormEmail({
    Key? key,
  }) : super(key: key);

  final TextEditingController emailController = TextEditingController();

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
          controller: emailController,
          obscureText: true,
          decoration: InputDecoration.collapsed(
            hintText: 'Tulis email kamu',
            hintStyle: GoogleFonts.montserrat(
              textStyle: TextStyle(fontSize: 12, fontWeight: coolBold),
            ),
          ),
        ),
      ),
    );
  }
}