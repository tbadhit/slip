import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:slip/models/berita_model.dart';

class BeritaService {

  static Future<List<BeritaModel>> getBerita() async {

  Uri url = Uri.parse('https://salary.kerjainaja.id/api/berita');
  var headers = {'Content-Type' : 'application/json'};

  var response = await http.get(url, headers: headers);

    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['data'] as List;
      List<BeritaModel> list = result.map((json) => BeritaModel.fromJson(json)).toList();

      return list;
    } else {
      throw Exception('Gagal memuat berita');
    }
  }
}