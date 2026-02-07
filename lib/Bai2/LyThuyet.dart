import 'dart:io';

import 'package:buoi2/Bai2/MonHoc.dart';

class Lythuyet extends MonHoc 
{
    double _diemtieuluan = 0.0;
    double _diemcuoiky = 0.0;

  Lythuyet.fullpare(super.mamh, super.tenmh, super.sotc, this._diemcuoiky, this._diemtieuluan) : super.fullpare();

  @override
  double DTB() {
    return _diemtieuluan*0.3 + _diemcuoiky*0.7;
  }
  @override
  void Nhap ()
  {
    super.Nhap();
    stdout.write('Hay nhap vao diem tieu luan: ');
    _diemtieuluan = double.parse(stdin.readLineSync()!);
    stdout.write('Hay nhap vao diem cuoi ky: ');
    _diemcuoiky = double.parse(stdin.readLineSync()!);
  }
}