import 'package:flutter/foundation.dart';
import 'package:slip/models/berita_model.dart';

class BeritaProvider extends ChangeNotifier {
  BeritaModel? _beritaModel;

  BeritaModel get beritaModel => _beritaModel!;

  set beritaModel(BeritaModel beritaModel) {
    _beritaModel = beritaModel;
    notifyListeners();
  }
} 