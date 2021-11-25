import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slip/models/berita_model.dart';
import 'package:slip/providers/theme_provider.dart';
import 'package:slip/theme/theme.dart';

Widget listWidget(BeritaModel itemNews, BuildContext context) {

  final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? kAmber : primaryColor;

  return 
  Card(
    elevation: 2,
    margin: EdgeInsets.only(bottom: 20),
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Icon(Icons.account_circle, size: 70),
          // Container(
          //   width: 80,
          //   height: 80,
          //   decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: NetworkImage(itemNews.imgUrl!),
              //   fit: BoxFit.cover
              // ),
          //     borderRadius: BorderRadius.circular(8)
          //   ),
          // ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(itemNews.judulBerita,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: color
                  ),
                ),),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Icon(Icons.person),
                    Text(itemNews.penerbit,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 12
                      ),
                    ),),
                    SizedBox(width: 10),
                    Icon(Icons.date_range),
                    Text(itemNews.tanggalTerbit,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 12
                      ),
                    ),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}