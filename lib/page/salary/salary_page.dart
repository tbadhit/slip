import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slip/providers/theme_provider.dart';
import 'package:slip/theme/theme.dart';

class SalaryPage extends StatelessWidget {
  const SalaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? kAmber : primaryColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text('Penggajian', style: GoogleFonts.montserrat()),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/main-page');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              'Data Karyawan',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: color, fontSize: 20)),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 2),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1, color: Colors.white, spreadRadius: 2)
                  ]),
              child: Row(
                children: <Widget>[
                  Text('1.',
                      style: GoogleFonts.montserrat(
                          textStyle:
                              TextStyle(color: color, fontSize: 15))),
                  SizedBox(width: 10),
                  Text(
                    'Fulan',
                    // penggajianModel.karyawan.namaKaryawan,
                      style: GoogleFonts.montserrat(
                          textStyle:
                              TextStyle(color: color, fontSize: 15))),
                  SizedBox(width: 50),
                  Text(
                    '31, Januari 2021',
                    // penggajianModel.karyawan.namaKaryawan,
                      style: GoogleFonts.montserrat(
                          textStyle:
                              TextStyle(color: color, fontSize: 15))),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.view_agenda,
                      color: color,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/detail-salary');
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
