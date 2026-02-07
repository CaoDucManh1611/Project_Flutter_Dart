import 'package:buoi2/Bai2/MonHoc.dart';
import 'dart:io';
class DoAn extends MonHoc
{
  double _gvhd = 0.0;
  double _gvpb = 0.0;

  DoAn.fullpare(super.mamh, super.tenmh, super.sotc, this._gvhd, this._gvpb) : super.fullpare();

  @override
  double DTB() {
    return (_gvhd+_gvpb)/2;
  }
  @override
  void Nhap () {
    super.Nhap();
    stdout.write('Hay nhap vao diem giao vien huong dan: ');
    _gvhd = double.parse(stdin.readLineSync()!);
    stdout.write('Hay nhap vao diem giao vien phan bien: ');
    _gvpb = double.parse(stdin.readLineSync()!);
  }

}