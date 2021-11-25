import 'package:flutter/foundation.dart';
import 'package:slip/models/berita_model.dart';
import 'package:slip/services/berita_service.dart';

class BeritaProvider extends ChangeNotifier {
  List<BeritaModel>? _listBerita;

  List<BeritaModel> get beritaModel => _listBerita!;

  set beritaModel(List<BeritaModel> listBerita) {
    _listBerita = listBerita;
    notifyListeners();
  }

  Future<List<BeritaModel>> getAllBerita() async {
    var data = await BeritaService.getAllBerita();
    _listBerita = data;
    return _listBerita!;
  }
}
