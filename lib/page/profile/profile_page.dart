import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slip/models/karyawan_model.dart';
import 'package:slip/providers/auth_providers.dart';
import 'package:slip/providers/theme_provider.dart';
import 'package:slip/theme/theme.dart';
import 'keluar_widget.dart';
import 'notifikasi_widget.dart';
import 'ubah_password_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    KaryawanModel karyawanModel = authProvider.karyawanModel;

    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? kAmber : primaryColor;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/ic_profile.png'),
              radius: 50,
            ),
            SizedBox(height: 20),
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama: ${karyawanModel.namaKaryawan}',
                  // '',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: color),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Status: ${karyawanModel.status}',
                  // '',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: color),
                  ),
                ),
              ],
            )),
            SizedBox(height: 20),
            BtnNotifikasi(),
            SizedBox(height: 20),
            BtnUbahPassword(),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text('Keluar'),
                        content: Text('Apakah anda yakin untuk keluar?'),
                        actions: [
                          CupertinoDialogAction(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Batal',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                          CupertinoDialogAction(
                            child: TextButton(
                              onPressed: () async {
                                // SharedPreferences preferences =
                                //     await SharedPreferences.getInstance();
                                // await preferences.clear();
                                Navigator.of(context).pushNamed('/sign-in');
                              },
                              child: Text('Yakin'),
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: BtnKeluar(),
            ),
          ],
        ),
      );
  }
}
