import 'package:buoi2/NhanVien/NhanVien.dart';

class CanBo extends NhanVien {
  String _chucvu = '';
  double _hschucvu = 0;

  CanBo.fullpare(super.manv, super.tennv, super.hsl, super.phongban, super.songay, this._chucvu, this._hschucvu) : super.fullpare();

  @override
  String toString() {
    return 'CanBo{_chucvu: $_chucvu, _hschucvu: $_hschucvu}';
  }
  @override
  double Luong() {
    return super.Luong() + _hschucvu * 1100;
  }
}