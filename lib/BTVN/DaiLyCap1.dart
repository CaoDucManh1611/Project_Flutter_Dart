import 'package:buoi2/BTVN/HoaDon.dart';
import 'dart:io';
class Dailycap1 extends HoaDon{
  double _thoigian;
  Dailycap1() :
        _thoigian = 0.0,
        super();
  Dailycap1.fullpare(super.makh, super.tenkh, super.soluong, super.giaban, double thoigian) :
        _thoigian = thoigian,
        super.fullpare();

  double get thoigian => _thoigian;

  set thoigian(double value) {
    if (value > 0) {
      _thoigian = value;
    }
    else
      {
        print ('Thoi gian > 0');
      }
  }
  @override
  void Nhap ()
  {
    super.Nhap();
    stdout.write('Hay nhap vao thoi gian: ');
    thoigian = double.parse(stdin.readLineSync()!);
  }
  @override
  double ChietKhau() {
    double tile = 0.3;
    if (thoigian > 5)
    {
      double namvuot = thoigian - 5;
      tile += namvuot * 0.01;
    }
    if (tile > 0.35) {
      tile = 0.35;
    }
    return tile * (soluong * giaban);
  }
  @override
  void Xuat ()
  {
    super.Xuat();
    print ("Khoang cach ${thoigian}");
  }
}