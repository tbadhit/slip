import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slip/providers/theme_provider.dart';
import 'package:slip/theme/theme.dart';

class DrawerModeWidget extends StatelessWidget {
  const DrawerModeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark 
    ? 'Mode Gelap' : 'Mode Terang';
    final icon =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? Icons.dark_mode_outlined : Icons.light_mode_outlined;
    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? Colors.amber : primaryColor;
    

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
            text,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(color: color),
            ),
          ),
          trailing: Switch.adaptive(
            value: themeProvider.isDarkMode, 
            onChanged: (value) {
              ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
              themeProvider.toggleTheme(value);
            }),
    );
  }
}
