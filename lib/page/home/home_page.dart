import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slip/models/karyawan_model.dart';
import 'package:slip/models/konten_model.dart';
import 'package:slip/providers/auth_providers.dart';
import 'package:slip/providers/konten_provider.dart';
import 'package:slip/providers/theme_provider.dart';
import 'package:slip/theme/theme.dart';
import 'mode_widget.dart';
import 'tentang_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    KaryawanModel karyawanModel = authProvider.karyawanModel;

    KontenProvider kontenProvider = Provider.of<KontenProvider>(context);
    List<KontenModel> listKonten = kontenProvider.kontenModel;

    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? kAmber : primaryColor;

    return Container(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(50)),
                      image: DecorationImage(
                          image: AssetImage('images/ic_bg.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 170),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 5)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Selamat Datang',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontSize: 15, color: color),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                karyawanModel.namaKaryawan,
                                // '',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontSize: 10,
                                      color: color),
                                ),)
                            ],
                          ),
                          SizedBox(width: 17),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Total gaji bulan ini',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontSize: 15, color: color),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('Rp. 1000.000',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontSize: 10,
                                      color: color),
                                ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('Konten Harian',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: color
                  ),
                ),),
              ),
              SizedBox(height: 20),
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                      height: 150,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      viewportFraction: 0.8,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800)),
                  items: listKonten.map((konten) => Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage('images/konten.jpg'),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            konten.judulKonten,
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                                konten.isiKonten,
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 15,
                                  ),
                                ),
                                textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                    ),).toList()
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('Karyawan',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: color
                  ),
                ),),
              ),
              SizedBox(height:20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width - 30.0,
                height: MediaQuery.of(context).size.width - 30.0,
                child: GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 0.8,
                  children: <Widget>[
                    buildCard('Fulan', 'images/ic_employe.png', 'Backend Developer', context),
                    buildCard('Fulan', 'images/ic_employe.png', 'Backend Developer', context),
                    buildCard('Fulan', 'images/ic_employe.png', 'Backend Developer', context),
                    buildCard('Fulan', 'images/ic_employe.png', 'Backend Developer', context),
                  ],
                ),
              ),
            ],
          ),
        );
  }

  Widget buildCard(String name, String imgPath, String employee, context) {

    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? kAmber : primaryColor;

    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 5, left: 5, right: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5
            ),
          ],
          color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            Text(employee,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 15,
                color: color
              ),
            ),),
            SizedBox(height: 10),
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.cover
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(name,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: color
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
