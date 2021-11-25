import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slip/models/berita_model.dart';
import 'package:slip/page/news/detail_news_page.dart';
import 'package:slip/page/news/list_news_widget.dart';
import 'package:slip/providers/theme_provider.dart';
import 'package:slip/services/berita_service.dart';
import 'package:slip/theme/theme.dart';
import 'list_news_item.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with SingleTickerProviderStateMixin {

  List<ListItemNews> _listItem = [
    ListItemNews(
      imgUrl: 'https://images.unsplash.com/photo-1637402964450-4a7faa01ce0f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=766&q=80',
      newsTitle: 'Lorem Ipsum',
      author: 'Fulan',
      date: '28 Jan 2021'),

      ListItemNews(
      imgUrl: 'https://images.unsplash.com/photo-1637345540120-38bb0bbb7871?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=995&q=80',
      newsTitle: 'Lorem Ipsum',
      author: 'Fulan',
      date: '28 Jan 2021'),

      ListItemNews(
      imgUrl: 'https://images.unsplash.com/photo-1637406304949-f4f3fbdc13b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=423&q=80',
      newsTitle: 'Lorem Ipsum',
      author: 'Fulan',
      date: '28 Jan 2021'),

      ListItemNews(
      imgUrl: 'https://images.unsplash.com/photo-1637431443406-126986cb542e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80',  
      newsTitle: 'Lorem Ipsum',
      author: 'Fulan',
      date: '28 Jan 2021'),

      ListItemNews(
      imgUrl: 'https://images.unsplash.com/photo-1637355366585-1d4105529cfd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',  
      newsTitle: 'Lorem Ipsum',
      author: 'Fulan',
      date: '28 Jan 2021'),

      ListItemNews(
      imgUrl: 'https://images.unsplash.com/photo-1637361875630-0bc47d056ca5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      newsTitle: 'Lorem Ipsum',
      author: 'Fulan',
      date: '28 Jan 2021'),
  ];

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // BeritaProvider beritaProvider = Provider.of<BeritaProvider>(context);
    // final allBerita = beritaProvider.allBerita;

    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? kAmber : primaryColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text('Berita',
        style: GoogleFonts.montserrat()
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/main-page');
          },
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: <Widget>[
            FutureBuilder(
              future: BeritaService.getBerita(),
              builder: (context, snapshot) {
                var list = snapshot.data as List<BeritaModel>?;
                return list != null ? Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    var berita = list[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => DetailNewsPage(itemNews: _listItem[index])));
                      },
                      child: listWidget(berita, context),
                    );
                  },
                ),
              ),
            ) : Center(child: CircularProgressIndicator(
              color: color,
            ),);
              }
            ),
            
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}