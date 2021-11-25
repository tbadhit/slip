import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slip/theme/theme.dart';

class DrawerJabatanWidget extends StatelessWidget {
  const DrawerJabatanWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.apps_outlined, color: primaryColor),
      title: Text(
        'Jabatan',
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(color: primaryColor),
        ),
      ),
      onTap: () {},
    );
  }
}