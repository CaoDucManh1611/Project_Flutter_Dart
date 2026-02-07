import 'dart:io';

class NhanVien {
  String _manv = '';
  String _tennv = '';
  double _hsl = 0;
  String _phongban = '';
  double _songay = 0;

  NhanVien.fullpare (String manv, String tennv, double hsl, String phongban,
      double songay)
  {
    _manv = manv;
    _tennv = tennv;
    _hsl = hsl;
    _phongban = phongban;
    _songay = songay;
  }

  double get songay => _songay;

  String get phongban => _phongban;

  double get hsl => _hsl;

  String get tennv => _tennv;

  String get manv => _manv;

  set songay(double value) {
    if (value > 0) {
      _songay = value;
    }
  }

  set phongban(String value) {
    if (value.isNotEmpty) {
      _phongban = value;
    }
  }

  set hsl(double value) {
    if (value > 0) {
      _hsl = value;
    }
  }

  set tennv(String value) {
    if (value.isNotEmpty) {
      _tennv = value;
    }
  }

  set manv(String value) {
    if (value.isNotEmpty) {
      _manv = value;
    }
  }

  String XepLoai() {
    if (_songay > 35) {
      return 'A';
    }
    else if (_songay > 22) {
      return 'B';
    }
    else {
      return 'C';
    }
  }
  double HeSoThiDua ()
  {
    if (XepLoai() == 'A') {
      return 1.00;
    }
    else if (XepLoai() == 'B') {
      return 0.75;
    }
    else {
      return 0.5;
    }
  }

  double Luong() {
    return 2340 * _hsl * HeSoThiDua();
  }

  @override
  String toString() {
    return 'Manv: $_manv|Ten nhan vien: $_tennv|He so luong: $_hsl|Phong ban: $_phongban|So ngay: $_songay|Xep loai: ${XepLoai()}|He so thi dua: ${HeSoThiDua()}|Luong: ${Luong()}';
  }
  


}