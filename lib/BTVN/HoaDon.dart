import 'dart:io';

abstract class HoaDon
{
  String _makh;
  String _tenkh;
  int _soluong;
  double _giaban;
  HoaDon():
  _makh = "",
  _tenkh = "",
  _soluong = 0,
  _giaban = 0.0;
  HoaDon.fullpare(String makh, String tenkh, int soluong, double giaban)
  :
    _makh = makh,
    _tenkh = tenkh,
    _soluong = soluong,
    _giaban = giaban;


  double get giaban => _giaban;

  set giaban(double value) {
    if (value > 0) {
      _giaban = value;
    }
    else
    {
      print('Gia ban > 0');
    }
  }

  int get soluong => _soluong;

  set soluong(int value) {
    if (value > 0) {
      _soluong = value;
    }
    else
      {
        print('So luong > 0');
      }
  }

  String get tenkh => _tenkh;

  set tenkh(String value) {
    if (value.isNotEmpty)
      {
        _tenkh = value;
      }
    else
      {
        print('Ten Khach hang khong duoc bo trong');
      }
  }

  String get makh => _makh;

  set makh(String value) {
    if (value.length == 6 &&
        value.startsWith("KH") &&
        int.tryParse(value.substring(2)) != null) {
      _makh = value;
      print("Cập nhật thành công!");

    } else {
      print("Lỗi: Mã khách hàng sai định dạng (Ví dụ đúng: KH0002)");
    }
  }
  double ChietKhau ();
  double ThueVAT ()
  {
    return 0.1 * (soluong * giaban);
  }
  double ThanhTien ()
  {
    return soluong * giaban - ChietKhau() + ThueVAT();
  }
  void Nhap ()
  {
    stdout.write('Hay nhap vao ma khach hang: ');
    makh = stdin.readLineSync()!;
    stdout.write('Hay nhap vao ten khach hang: ');
    tenkh = stdin.readLineSync()!;
    stdout.write('Hay nhap vao so luong: ');
    soluong = int.parse(stdin.readLineSync()!);
    stdout.write('Hay nhap vao gia ban: ');
    giaban =double.parse(stdin.readLineSync()!);
  }
  void Xuat ()
  {
    print('Ma khach hang: ${makh}');
    print('Ten khach hang: ${tenkh}');
    print('So luong: ${soluong}');
    print('Gia ban: ${giaban}');
    print('Chiet khau: ${ChietKhau()}');
    print('VAT: ${ThueVAT()}');
    print('Thanh tien: ${ThanhTien()}');
  }

}