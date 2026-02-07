import 'dart:io';

import 'package:buoi2/BTVN/HoaDon.dart';
import 'package:buoi2/BTVN/UuDai.dart';

class KhachHangCaNhan extends HoaDon implements ITroGia{
  double _khoangcach;
  KhachHangCaNhan() :
        _khoangcach = 0.0,
        super();
  KhachHangCaNhan.fullpare(super.makh, super.tenkh, super.soluong, super.giaban, double khoangcach) :
        _khoangcach = khoangcach,
        super.fullpare();

  double get khoangcach => _khoangcach;

  set khoangcach(double value) {
    if (value > 0) {
      _khoangcach = value;
    }
    else
      {
        print('Khoang cach > 0');
      }
  }
  @override
  void Nhap ()
  {
    super.Nhap();
    stdout.write('Hay nhap vao khoang cach: ');
    khoangcach = double.parse(stdin.readLineSync()!);
  }
  @override
  double HoTro() {
    double tonghotro = (0.02 * giaban) * soluong;
    if (soluong > 2)
      {
        tonghotro += 100000;
      }
    return tonghotro;
  }

  @override
  double ChietKhau() {
    double tongChietKhau = 0;
    if (soluong >= 3) {
      tongChietKhau += (0.05 * giaban) * soluong;
    }
    if (khoangcach < 10) {
      tongChietKhau += 50000 * soluong;
    }
    return tongChietKhau;
  }

  @override
  void Xuat ()
  {
    super.Xuat();
    print('Tro gia khach hang la ca nhan: ${HoTro()}');
    print ("Khoang cach ${khoangcach}");
  }
}