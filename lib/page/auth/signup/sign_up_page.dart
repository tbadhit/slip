import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slip/theme/theme.dart';
import 'form_email_widget.dart';
import 'form_namefull_widget.dart';
import 'form_password_widget.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 120),
              child: Center(
                child: Text(
                  'Daftar',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 36,
                        fontWeight: semiBold,
                        color: primaryColor),
                  ),
                ),
              ),
            ),
            SizedBox(height: 85),
            Text(
              'Nama Lengkap',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: 14, fontWeight: semiBold, color: kBlackColor),
              ),
            ),
            SizedBox(height: 4),
            FormNameFull(),
            SizedBox(height: 18),
            Text(
              'Email',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: 14, fontWeight: semiBold, color: kBlackColor),
              ),
            ),
            SizedBox(height: 4),
            FormEmail(),
            SizedBox(height: 18),
            Text(
              'Password',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: 14, fontWeight: semiBold, color: kBlackColor),
              ),
            ),
            SizedBox(height: 4),
            FormPassword(),
            SizedBox(height: 40),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/main-page');
              },
              child: Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: primaryColor
                ),
                child: Center(
                  child: Text('Daftar',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: semiBold,
                      color: kWhiteColor
                    ),
                  ),),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Sudah punya akun?',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 12,
                    color: kBlackColor
                  ),
                ),),
                SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/sign-in');
                  },
                  child: Text('Masuk',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 12,
                      color: primaryColor,
                      fontWeight: semiBold
                    ),
                  ),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}