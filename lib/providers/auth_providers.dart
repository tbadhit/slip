import 'package:flutter/foundation.dart';
import 'package:slip/models/karyawan_model.dart';
import 'package:slip/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  
  KaryawanModel? _karyawanModel;

  KaryawanModel get karyawanModel  => _karyawanModel!;

  set karyawanModel(KaryawanModel karyawanModel) {
    _karyawanModel = karyawanModel;
    notifyListeners();
  }

  Future<bool> login({String? username, String? password}) async {
    try {
      KaryawanModel karyawanModel = await AuthService().login(
        username: username!, 
        password: password!
      );

      _karyawanModel = karyawanModel;
      return true;

    } catch (e) {
      print(e);
      return false;
    }
  }
}