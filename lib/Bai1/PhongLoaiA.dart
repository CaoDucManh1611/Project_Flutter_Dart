import 'package:buoi2/Bai1/PhongTro.dart';

class PhongloaiA extends PhongTro {
  int _songuoithan = 0;
  PhongloaiA.fullpare (super.masophong, super.songuoi, super.sodien, super.sonuoc, this._songuoithan) : super.fullpare();

  @override
  double TienPhong() {
    return 1400 + 2*sodien + 8*sonuoc+50*_songuoithan;
  }

  @override
  void Xuat() {
    super.Xuat();
    print('So nguoi than: $_songuoithan');

  }

}