import 'dart:io';

import 'package:buoi2/Bai2/MonHoc.dart';

class ThucHanh extends MonHoc
{
  double _mon1 = 0.0;
  double _mon2 = 0.0;
  double _mon3 = 0.0;

  ThucHanh.fullpare(super.mamh, super.tenmh, super.sotc, this._mon1, this._mon2, this._mon3) : super.fullpare();

  @override
  double DTB() {
    return (_mon1+_mon2+_mon3)/3;
  }
  @override
  void Nhap ()
  {
    super.Nhap();
    stdout.write('Hay nhap vao diem mon 1: ');
    _mon1 = double.parse(stdin.readLineSync()!);
    stdout.write('Hay nhap vao diem mon 2: ');
    _mon2 = double.parse(stdin.readLineSync()!);
    stdout.write('Hay nhap vao diem mon 3: ');
    _mon3 = double.parse(stdin.readLineSync()!);
  }

}