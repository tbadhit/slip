import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slip/providers/theme_provider.dart';
import 'package:slip/theme/theme.dart';

class BtnKeluar extends StatelessWidget {
  const BtnKeluar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? kAmber : primaryColor;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xfff5f6f9)
        ),
        child: Row(
          children: <Widget>[
            Icon(Icons.exit_to_app, color: color),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                'Keluar',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: color
                  ),
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: color)
          ],
        ),
    );
  }
}
