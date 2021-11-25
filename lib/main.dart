import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slip/page/salary/detail_salary_page.dart';
import 'package:slip/page/salary/salary_page.dart';
import 'package:slip/providers/auth_providers.dart';
import 'package:slip/providers/berita_provider.dart';
import 'package:slip/providers/konten_provider.dart';
import 'package:slip/providers/penggajian_provider.dart';
import 'page/about/about_page.dart';
import 'page/auth/signin/sign_in_page.dart';
import 'page/auth/signup/sign_up_page.dart';
import 'page/main_page.dart';
import 'page/splash/splash_screen_page.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => BeritaProvider()),
        ChangeNotifierProvider(create: (context) => PenggajianProvider()),
        ChangeNotifierProvider(create: (context) => KontenProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      builder: (context, _) {
        final changeTheme = Provider.of<ThemeProvider>(context);
    
      return MaterialApp(
        title: 'Flutter Demo',
        // set dark mode
        themeMode: changeTheme.themeMode,
        theme: MyThemes.lightTheme,
        // ThemeData(
        //   primarySwatch: Colors.blue
        // ),
        darkTheme: MyThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => SplashScreenPage(),
          '/sign-in' : (context) => SigninPage(),
          '/sign-up' : (context) => SignupPage(),
          '/main-page' : (context) => MainPage(),
          '/about-page' : (context) => AboutPage(),
          // '/detail-news' : (context) => DetailNewsPage()
          '/detail-salary' : (context) => DetailSalaryPage(),
          '/salary-page' : (context) => SalaryPage()
        },
      );
      }
    );
  }
}