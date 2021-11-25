import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slip/providers/berita_provider.dart';
import 'package:slip/providers/konten_provider.dart';
import 'package:slip/providers/penggajian_provider.dart';
import 'package:slip/providers/theme_provider.dart';
import 'package:slip/theme/theme.dart';

class SplashScreenPage extends StatefulWidget {

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  // bool? isUser = false;

  // void _initCheck() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   if(prefs.getBool('isUser') != null) {
  //     setState(() {
  //       isUser = prefs.getBool('isUser');
  //     });
  //   }
  // } 

  @override
  void initState() {
   
    getInit();

    super.initState();
  }


  getInit() async {
    await Provider.of<PenggajianProvider>(context, listen: false).getPenggajian();
    await Provider.of<KontenProvider>(context, listen: false).getAllKonten();
    await Provider.of<BeritaProvider>(context, listen: false).getAllBerita();
    Navigator.pushNamed(context, '/sign-in');
  }

  @override
  Widget build(BuildContext context) {

    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? k900 : primaryColor;

    return Scaffold(
      backgroundColor: color,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                width: 93,
                height: 114,
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('images/ic_splash.png')),
                ),
              ),
            ),
            SizedBox(height: 60),
            Text(
              'Salariy.id',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: semiBold,
                    color: kWhiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
