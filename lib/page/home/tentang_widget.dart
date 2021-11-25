import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slip/providers/theme_provider.dart';
import 'package:slip/theme/theme.dart';

class DrawerTentangWidget extends StatelessWidget {
  const DrawerTentangWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? Colors.amber : primaryColor;

    return ListTile(
      leading: Icon(Icons.help_center_outlined, color: color),
      title: Text(
        'Tentang Kami',
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(color: color),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/about-page');
      },
    );
  }
}