import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slip/providers/auth_providers.dart';
import 'package:slip/providers/theme_provider.dart';
import 'package:slip/theme/theme.dart';
import 'package:slip/widget/loading_button.dart';

class SigninPage extends StatefulWidget {

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController usernameController = TextEditingController(text: '');

  final TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    
    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? kAmber : primaryColor;

    final secondColor =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? kWhiteColor : kBlackColor;

    handleLogin() async {

      setState(() {
        isLoading = true;
      });

      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setBool('isUser', true);

      if(await authProvider.login(
        username: usernameController.text,
        password: passwordController.text
      )){
         Navigator.pushNamed(context, '/main-page'); 
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: color,
            content: Text('Gagal Login',
            textAlign: TextAlign.center),
          )
        );
      }

      setState(() {
        isLoading = false;
      });
    }

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
                  'Masuk',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 36,
                        fontWeight: semiBold,
                        color: color),
                  ),
                ),
              ),
            ),
            SizedBox(height: 85),
            Text(
              'Username',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: 14, fontWeight: semiBold, color: color),
              ),
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.only(left: 20),
              height: 43,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: Center(
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Tulis username kamu',
                    hintStyle: GoogleFonts.montserrat(
                      textStyle: TextStyle(fontSize: 12, fontWeight: coolBold),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),
            Text(
              'Password',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: 14, fontWeight: semiBold, color: color),
              ),
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.only(left: 20),
              height: 43,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: Center(
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Tulis password kamu',
                    hintStyle: GoogleFonts.montserrat(
                      textStyle: TextStyle(fontSize: 12, fontWeight: coolBold),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 4),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Lupa Password',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: semiBold,
                      color: color
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: handleLogin,
              child: isLoading ? LoadingButton() : Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: color
                ),
                child: Center(
                  child: Text('Masuk',
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
                Text('Belum punya akun?',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 12,
                    color: secondColor
                  ),
                ),),
                SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/sign-up');
                  },
                  child: Text('Daftar',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 12,
                      color: color,
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
