import 'dart:convert';
import 'package:slip/models/karyawan_model.dart';
import 'package:http/http.dart' as http;

class AuthService {

  String baseUrl = 'https://salary.kerjainaja.id/api';

  Future<KaryawanModel> login({
    required String username, 
    required String password
    }) async {

      Uri url = Uri.parse('$baseUrl/login_karyawan');
      var headers = {'Content-Type' : 'application/json'};
      var body = jsonEncode({
        'username' : username,
        'password' : password 
      });

      var response = await http.post(
        url,
        headers: headers,
        body: body
      );

      // print(response.body);

      if(response.statusCode == 200) {
        var data = jsonDecode(response.body);
        KaryawanModel karyawan = KaryawanModel.fromJson(data['karyawan']);
        return karyawan;
      } else {
        throw Exception('Gagal Login');
      }
    }
}