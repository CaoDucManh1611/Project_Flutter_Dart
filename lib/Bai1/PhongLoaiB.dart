import 'package:buoi2/Bai1/PhongTro.dart';

class PhongloaiB extends PhongTro {
  double _giatui = 0.0;
  int _somay = 0;
  PhongloaiB.fullpare (super.masophong, super.songuoi, super.sodien, super.sonuoc, this._giatui, this._somay) : super.fullpare();

  @override
  double TienPhong() {
    return 2000 + 2*sodien + 8*sonuoc+_giatui*5+_somay*100;
  }

  @override
  void Xuat() {
    super.Xuat();
    print('Giat ui: $_giatui');
    print('so may: $_somay');

  }


}