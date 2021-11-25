import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slip/page/news/list_news_item.dart';
import 'package:slip/theme/theme.dart';

class DetailNewsPage extends StatelessWidget {
  
  final ListItemNews itemNews;
  DetailNewsPage({required this.itemNews});

  @override
  Widget build(BuildContext context) {  

    // BeritaProvider beritaProvider = Provider.of<BeritaProvider>(context);
    // BeritaModel beritaModel = beritaProvider.beritaModel;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(itemNews.imgUrl!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: <Widget>[
                        Text(
                          itemNews.newsTitle!,
                          // beritaModel.judulBerita,
                          style: GoogleFonts.montserrat(
                            textStyle:
                                TextStyle(fontSize: 22, fontWeight: semiBold),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Icon(Icons.person),
                            Text(
                              itemNews.author!,
                              // beritaModel.penerbit,
                              style: GoogleFonts.montserrat(
                                textStyle:
                                    TextStyle(fontSize: 12),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Icon(Icons.date_range),
                            Text(
                              itemNews.date!,
                              // beritaModel.tanggalTerbit,
                              style: GoogleFonts.montserrat(
                                textStyle:
                                    TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                          // beritaModel.isiBerita,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 18  
                          ),
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: kWhiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
