import 'package:flutter/material.dart';
import '../model/chi_tieu.dart';
import '../database/db_helper.dart';

class ChiTieuProvider extends ChangeNotifier {
  List<ChiTieu> _dsChiTieu = [];
  List<ChiTieu> get dsChiTieu => _dsChiTieu;

  double get tongChiTieu {
    return _dsChiTieu.fold(0, (sum, item) => sum + item.soTien);
  }

  Future<void> loadData() async {
    notifyListeners();
  }

  void addChiTieu(ChiTieu item) {
    _dsChiTieu.add(item);
    notifyListeners();
  }

  void removeChiTieu(int index) {
    _dsChiTieu.removeAt(index);
    notifyListeners();
  }
}