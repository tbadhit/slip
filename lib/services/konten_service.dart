import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:slip/models/konten_model.dart';

class KontenService {
  static Future<List<KontenModel>> getAllKonten() async {
    Uri url = Uri.parse('https://salary.kerjainaja.id/api/konten');
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['data'] as List;
      List<KontenModel> list =
          result.map((json) => KontenModel.fromJson(json)).toList();

      return list;
    } else {
      throw Exception('Gagal memuat berita');
    }
  }
}
