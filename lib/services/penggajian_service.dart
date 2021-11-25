import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:slip/models/penggajian_model.dart';

class PenggajianService {

  Future<List<PenggajianModel>> getPenggajian() async {
  
    Uri url = Uri.parse('https://salary.kerjainaja.id/api/penggajian/4');
    var headers = {
      'Content-Type' : 'application-json'
    };

    var response = await http.get(url, headers: headers);

    // print(response.body);

    if(response.statusCode == 200) {
      List data = jsonDecode(response.body)['karyawan']['gaji'];
      List<PenggajianModel> list = [];

      for(var item in data) {
        list.add(PenggajianModel.fromJson(item));
      }

      return list;

    } else {
      throw Exception('Gagal memuat data karyawan');
    }
  }
}