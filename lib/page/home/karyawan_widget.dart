import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slip/theme/theme.dart';

class DrawerKaryawanWidget extends StatelessWidget {
  const DrawerKaryawanWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person_pin, color: primaryColor),
      title: Text(
        'Karyawan',
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(color: primaryColor),
        ),
      ),
      onTap: () {},
    );
  }
}
