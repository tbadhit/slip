import 'package:flutter/foundation.dart';
import 'package:slip/models/penggajian_model.dart';
import 'package:slip/services/penggajian_service.dart';

class PenggajianProvider extends ChangeNotifier {
  List<PenggajianModel> _penggajian = [];

  List<PenggajianModel> get data => _penggajian;

  set data(List<PenggajianModel> penggajianModel) {
    _penggajian = data;
    notifyListeners();
  }

  Future<void> getPenggajian() async {

    try {
      List<PenggajianModel> data = await PenggajianService().getPenggajian();
      _penggajian = data;
    } catch (e) {
      print(e);
    }
  }
}