import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slip/models/berita_model.dart';
import 'package:slip/page/news/list_news_item.dart';
import 'package:slip/theme/theme.dart';

class DetailNewsPage extends StatelessWidget {
  
  final BeritaModel itemNews;
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
                  Image.network("https://puprpkpp.riau.go.id/asset/img/default-image.png",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: <Widget>[
                        Text(
                          itemNews.judulBerita,
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
                              itemNews.penerbit,
                              // beritaModel.penerbit,
                              style: GoogleFonts.montserrat(
                                textStyle:
                                    TextStyle(fontSize: 12),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Icon(Icons.date_range),
                            Text(
                              itemNews.tanggalTerbit,
                              // beritaModel.tanggalTerbit,
                              style: GoogleFonts.montserrat(
                                textStyle:
                                    TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text(itemNews.isiBerita,
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
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
