import 'dart:io';

class SanPham
{
  String _masp = '';
  String _tensp = '';
  double _dongia = 0;
  double _giamgia = 0;
  SanPham()
  {
    _masp = 'Null';
    _tensp = 'Null';
    _dongia = 0;
    _giamgia = 0;
  }
  SanPham.fullpara(String masp, String tensp, double dongia, giamgia)
  {
    _masp = masp;
    _tensp = tensp;
    _dongia = dongia;
    _giamgia = giamgia;
  }

  double get giamgia => _giamgia;

  double get dongia => _dongia;

  String get tensp => _tensp;

  String get masp => _masp;
  set masp (String value){
    if (value.isNotEmpty)
      {
        _masp = value;
      }
  }
  set dongia (double value){
    if (value>0)
    {
      _dongia = value;
    }
  }
  double tinhthuenhapkhau ()
  {
    return 0.01 * _dongia;
  }
  void showinfo ()
  {
    stdout.writeln('Ma san pham: $_masp');
    stdout.writeln('Ten san pham:  $_tensp');
    stdout.writeln('Giam gia: $_giamgia');
    stdout.writeln('Don gia: $_dongia');
    stdout.writeln('Thue nhap khau: ${tinhthuenhapkhau()}');

  }


}
