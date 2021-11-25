import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slip/models/karyawan_model.dart';
import 'package:slip/page/home/home_page.dart';
import 'package:slip/page/news/news_page.dart';
import 'package:slip/page/profile/profile_page.dart';
import 'package:slip/page/salary/salary_page.dart';
import 'package:slip/providers/auth_providers.dart';
import 'package:slip/providers/theme_provider.dart';
import 'package:slip/theme/theme.dart';

import 'home/mode_widget.dart';
import 'home/tentang_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  var appbarTitle = "Salary.id";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this)..addListener(() {
      setState(() {
        switch (_tabController!.index) {
          case 0:
            appbarTitle = "Salary.id";
            break;
          case 1:
            appbarTitle = "Penggajian";
            break;
          case 2:
            appbarTitle = "Berita";
            break;
          case 3:
            appbarTitle = "Profile";
            break;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    KaryawanModel karyawanModel = authProvider.karyawanModel;

    final color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? kAmber
            : primaryColor;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: color,
          title: Text(appbarTitle,
              style: GoogleFonts.montserrat()),
          centerTitle: true),
      drawer: Drawer(
        child: Material(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              SizedBox(height: 50),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/ic_profile.png'),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        karyawanModel.namaKaryawan,
                        // '',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(color: color),
                        ),
                      ),
                      Text(
                        karyawanModel.status,
                        // '',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(color: color),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 30),
              // DrawerKaryawanWidget(),
              // DrawerTunjanganWidget(),
              // DrawerJabatanWidget(),
              // DrawerKontenWidget(),
              // SizedBox(height: 25),
              Divider(color: Colors.grey),
              DrawerTentangWidget(),
              DrawerModeWidget(),
            ],
          ),
        ),
      ),
      body: TabBarView(
        children: <Widget>[HomePage(), SalaryPage(), NewsPage(), ProfilePage()],
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: color),
        child: TabBar(
          labelColor: kWhiteColor,
          unselectedLabelColor: Colors.grey,
          labelPadding: EdgeInsets.symmetric(horizontal: 0),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: kWhiteColor, width: 0),
          ),
          tabs: <Widget>[
            Tab(text: 'Home', icon: Icon(Icons.home)),
            Tab(text: 'Penggajian', icon: Icon(Icons.transform_rounded)),
            Tab(text: 'Berita', icon: Icon(Icons.now_widgets_sharp)),
            Tab(text: 'Profile', icon: Icon(Icons.person))
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
