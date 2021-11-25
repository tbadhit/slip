import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slip/page/home/home_page.dart';
import 'package:slip/page/news/news_page.dart';
import 'package:slip/page/profile/profile_page.dart';
import 'package:slip/page/salary/salary_page.dart';
import 'package:slip/providers/theme_provider.dart';
import 'package:slip/theme/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? kAmber : primaryColor;

    return Scaffold(
      body: TabBarView(
        children: <Widget>[
         HomePage(),
         SalaryPage(),
         NewsPage(),
         ProfilePage() 
        ],
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color 
        ),
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

