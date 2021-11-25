import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slip/models/penggajian_model.dart';
import 'package:slip/providers/penggajian_provider.dart';
import 'package:slip/providers/theme_provider.dart';
import 'package:slip/theme/theme.dart';

class DetailSalaryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    PenggajianProvider authProvider = Provider.of<PenggajianProvider>(context);
    Karyawan karyawanModel = authProvider.data;

    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? kAmber : primaryColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text('Detail-Penggajian', style: GoogleFonts.montserrat()),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(karyawanModel.namaKaryawan,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 20
                ),
              ),),
              SizedBox(height: 25,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kWhiteColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      color: Colors.grey,
                      spreadRadius: 1
                    )
                  ]
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Data Karyawan',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: color
                      ),
                    ),),
                    SizedBox(height: 10,),
                    Divider(thickness: 2,),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Text('Nama Lengkap',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: color
                      ),
                    ),),
                        SizedBox(width: 120,),
                        Text(karyawanModel.namaKaryawan,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: color
                      ),
                    ),),
                        SizedBox(height: 10,),
                        Divider(thickness: 2,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 2,),
                    SizedBox(height: 10,),
                    // // Row(
                    // //   children: <Widget>[
                    // //     Text('Jabatan',
                    // // style: GoogleFonts.montserrat(
                    // //   textStyle: TextStyle(
                    // //     color: color
                    // //   ),
                    // // ),),
                    // //     SizedBox(width: 100,),
                    // //     Text('Backend Developer',
                    // // style: GoogleFonts.montserrat(
                    // //   textStyle: TextStyle(
                    // //     color: color
                    // //   ),
                    // // ),),
                    // //     SizedBox(height: 10,),
                    // //     Divider(thickness: 2,),
                    // //   ],
                    // // ),
                    // SizedBox(height: 10,),
                    // Divider(thickness: 2,),
                    // SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Text('Status',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: color
                      ),
                    ),),
                        SizedBox(width: 120,),
                        Text(karyawanModel.status,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: color
                      ),
                    ),),
                        SizedBox(height: 10,),
                        Divider(thickness: 2,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 2,),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Text('Nomor Handphone',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: color
                      ),
                    ),),
                        SizedBox(width: 70,),
                        Text(karyawanModel.nomorHp,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: color
                      ),
                    ),),
                        SizedBox(height: 10,),
                        Divider(thickness: 2,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 2,),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Text('Username',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: color
                      ),
                    ),),
                        SizedBox(width: 120,),
                        Text(karyawanModel.username,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: color
                      ),
                    ),),
                        SizedBox(height: 10,),
                        Divider(thickness: 2,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 2,),
                    Divider(thickness: 2,),
                    SizedBox(height: 10,),
                    // Row(
                    //   children: <Widget>[
                    //     Text('Tanggal Penggajian',
                    // style: GoogleFonts.montserrat(
                    //   textStyle: TextStyle(
                    //     color: color
                    //   ),
                    // ),),
                    //     SizedBox(width: 100,),
                    //     Text('Nominal',
                    // style: GoogleFonts.montserrat(
                    //   textStyle: TextStyle(
                    //     color: color
                    //   ),
                    // ),),
                    //     SizedBox(height: 10,),
                    //     Divider(thickness: 2,),
                    //   ],
                    // ),
                    // SizedBox(height: 10,),
                    // Divider(thickness: 2,),
                    // SizedBox(height: 10,),
                    // Row(
                    //   children: <Widget>[
                    //     Text('2021-11-20',
                    // style: GoogleFonts.montserrat(
                    //   textStyle: TextStyle(
                    //     color: color
                    //   ),
                    // ),),
                    //     SizedBox(width: 120,),
                    //     Text('Rp. 2,400,000',
                    // style: GoogleFonts.montserrat(
                    //   textStyle: TextStyle(
                    //     color: color
                    //   ),
                    // ),),
                    //     SizedBox(height: 10,),
                    //     Divider(thickness: 2,),
                    //   ],
                    // ),
                    // SizedBox(height: 10,),
                    // Divider(thickness: 2,),
                    // SizedBox(height: 10,),
                    // Row(
                    //   children: <Widget>[
                    //     Text('2021-11-20',
                    // style: GoogleFonts.montserrat(
                    //   textStyle: TextStyle(
                    //     color: color
                    //   ),
                    // ),),
                    //     SizedBox(width: 120,),
                    //     Text('Rp. 400,000',
                    // style: GoogleFonts.montserrat(
                    //   textStyle: TextStyle(
                    //     color: color
                    //   ),
                    // ),),
                    //     SizedBox(height: 10,),
                    //     Divider(thickness: 2,),
                    //   ],
                    // ),
                    // SizedBox(height: 10,),
                    // Divider(thickness: 2,),
                    // SizedBox(height: 10,),
                    // Row(
                    //   children: <Widget>[
                    //     Text('2021-11-21',
                    // style: GoogleFonts.montserrat(
                    //   textStyle: TextStyle(
                    //     color: color
                    //   ),
                    // ),),
                    //     SizedBox(width: 120,),
                    //     Text('Rp. 2,580,000',
                    // style: GoogleFonts.montserrat(
                    //   textStyle: TextStyle(
                    //     color: color
                    //   ),
                    // ),),
                    //     SizedBox(height: 10,),
                    //     Divider(thickness: 2,),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}