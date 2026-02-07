abstract class PhongTro
{
  String _masophong = '';
  int _songuoi = 0;
  double _sodien = 0.0;
  double _sonuoc = 0.0;

  PhongTro.fullpare(String masophong, int songuoi, double sodien, double sonuoc)
  {
    _masophong = masophong;
    _songuoi = songuoi;
    _sodien = sodien;
    _sonuoc = sonuoc;
  }


  double get sonuoc => _sonuoc;

  set sonuoc(double value) {
    _sonuoc = value;
  }

  double get sodien => _sodien;

  set sodien(double value) {
    _sodien = value;
  }

  int get songuoi => _songuoi;

  set songuoi(int value) {
    _songuoi = value;
  }

  String get masophong => _masophong;

  set masophong(String value) {
    _masophong = value;
  }
  double TienPhong ();


  void Xuat() {
    print( 'masophong: $_masophong, songuoi: $_songuoi, sodien: $_sodien, sonuoc: $_sonuoc');
    print('Tien phong: ${TienPhong()}');
  }

}