import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:slip/models/penggajian_model.dart';

class PenggajianService {

  Future<Karyawan> getPenggajian() async {
  
    Uri url = Uri.parse('https://salary.kerjainaja.id/api/penggajian/4');
    var headers = {
      'Content-Type' : 'application-json'
    };

    var response = await http.get(url, headers: headers);

    // print(response.body);

    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result= data['karyawan'];

      return Karyawan.fromJson(result);

    } else {
      throw Exception('Gagal memuat data karyawan');
    }
  }
}