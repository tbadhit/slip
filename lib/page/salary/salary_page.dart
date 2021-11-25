import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slip/models/karyawan_model.dart';
import 'package:slip/models/penggajian_model.dart';
import 'package:slip/providers/auth_providers.dart';
import 'package:slip/providers/penggajian_provider.dart';
import 'package:slip/providers/theme_provider.dart';
import 'package:slip/theme/theme.dart';

class SalaryPage extends StatelessWidget {
  const SalaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    PenggajianProvider authProvider = Provider.of<PenggajianProvider>(context);
    Karyawan karyawanModel = authProvider.data;

    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? kAmber : primaryColor;

    return Padding(
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
                    karyawanModel.namaKaryawan,
                    // penggajianModel.karyawan.namaKaryawan,
                      style: GoogleFonts.montserrat(
                          textStyle:
                              TextStyle(color: color, fontSize: 15))),
                  SizedBox(width: 50),
                  Text(
                    karyawanModel.tanggalMasuk,
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
      );
  }
}
