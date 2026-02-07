import 'package:buoi2/BTVN/HoaDon.dart';
import 'dart:io';

import 'package:buoi2/BTVN/UuDai.dart';
class KhachHangLaCongTy extends HoaDon implements ITroGia {
  int _soluongnv;
  KhachHangLaCongTy() :
        _soluongnv = 0,
        super();
  KhachHangLaCongTy.fullpare(super.makh, super.tenkh, super.soluong, super.giaban, int soluongnv) :
        _soluongnv = soluongnv,
        super.fullpare();

  int get soluongnv => _soluongnv;

  set soluongnv(int value) {
    if (value > 0) {
      _soluongnv = value;
    }
    else
      {
        print('So luong > 0');
      }
  }
  @override
  void Nhap ()
  {
    super.Nhap();
    stdout.write('Hay nhap vao so luong nhan vien: ');
    soluongnv = int.parse(stdin.readLineSync()!);
  }
  @override
  double HoTro() {
    return soluong * 120000;
  }
  @override
  double ChietKhau() {
    if (soluongnv > 5000)
    {
      return 0.07; // Ưu tiên kiểm tra mức cao nhất trước
    }
    else if (soluongnv > 1000)
    {
      return 0.05;
    }
    else
    {
      return 0.0;
    }
  }
  @override
  void Xuat ()
  {
    super.Xuat();
    print('Tro gia khach hang la cong ty: ${HoTro()}');
    print ("So luong nhan vien: ${soluongnv}");
  }
}