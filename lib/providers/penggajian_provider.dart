import 'package:flutter/foundation.dart';
import 'package:slip/models/penggajian_model.dart';
import 'package:slip/services/penggajian_service.dart';

class PenggajianProvider extends ChangeNotifier {
  Karyawan? _penggajian;

  Karyawan get data => _penggajian!;

  set data(Karyawan penggajianModel) {
    _penggajian = data;
    notifyListeners();
  }

  Future<void> getPenggajian() async {

    try {
      Karyawan data = await PenggajianService().getPenggajian();
      _penggajian = data;
    } catch (e) {
      print(e);
    }
  }
}