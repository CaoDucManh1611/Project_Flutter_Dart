import 'dart:io';

abstract class MonHoc
{
  String _mamh = '';
  String _tenmh = '';
  int _sotc = 0;

  MonHoc.fullpare(String mamh, String tenmh, int sotc)
  {
    _mamh = mamh;
    _tenmh = tenmh;
    _sotc = sotc;
  }

  int get sotc => _sotc;

  set sotc(int value) {
    _sotc = value;
  }

  String get tenmh => _tenmh;

  set tenmh(String value) {
    _tenmh = value;
  }

  String get mamh => _mamh;

  set mamh(String value) {
    _mamh = value;
  }
  double DTB ();
  void Nhap ()
  {
    stdout.write('Hay nhap vao ma mon hoc: ');
    mamh = stdin.readLineSync()!;
    stdout.write('Hay nhap vao ten mon hoc: ');
    tenmh = stdin.readLineSync()!;
    stdout.write('Hay nhap vao so tin chi: ');
    sotc = int.parse(stdin.readLineSync()!);
  }
  void Xuat ()
  {
    print('Hay nhap vao ma mon hoc: $mamh', );
    print('Hay nhap vao ten mon hoc: $tenmh');
    print('Hay nhap vao so tin chi: $sotc');
    print('Diem trung binh: ${DTB()}');
  }
}
