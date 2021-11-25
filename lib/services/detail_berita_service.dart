import 'package:slip/models/detail_berita_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailBeritaService {

  Future<List<DetailBeritaModel>> getDetailBerita() async {

  Uri url = Uri.parse('https://salary.kerjainaja.id/api/detail_berita/2');
  var headers = {'Content-Type' : 'application/json'};

  var response = await http.get(url, headers: headers);

    // print(response.body);

    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['data'] as List;
      List<DetailBeritaModel> list = result.map((json) => DetailBeritaModel.fromJson(json)).toList();

      return list;
    } else {
      throw Exception('Gagal memuat berita');
    }
  }
}