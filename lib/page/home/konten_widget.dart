import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slip/theme/theme.dart';

class DrawerKontenWidget extends StatelessWidget {
  const DrawerKontenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.content_paste, color: primaryColor),
      title: Text(
        'Konten Harian',
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(color: primaryColor),
        ),
      ),
      onTap: () {},
    );
  }
}