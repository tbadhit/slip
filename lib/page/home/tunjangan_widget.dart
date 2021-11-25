import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slip/theme/theme.dart';

class DrawerTunjanganWidget extends StatelessWidget {
  const DrawerTunjanganWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.data_usage, color: primaryColor),
      title: Text(
        'Tunjangan',
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(color: primaryColor),
        ),
      ),
      onTap: () {},
    );
  }
}
