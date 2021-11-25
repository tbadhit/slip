import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slip/providers/theme_provider.dart';
import 'package:slip/theme/theme.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? kAmber : primaryColor;

    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28), color: color),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(
                  kWhiteColor
                ),
              )),
              SizedBox(width: 5),
            Text(
              'Loading',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: 18, fontWeight: semiBold, color: kWhiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
