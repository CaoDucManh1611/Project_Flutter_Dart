import 'dart:io';
import 'package:buoi2/BTVN/DaiLyCap1.dart';
import 'package:buoi2/BTVN/HoaDon.dart';
import 'package:buoi2/BTVN/KhachHangCaNhan.dart';
import 'package:buoi2/BTVN/KhachHangLaCongTy.dart';
import 'package:buoi2/BTVN/UuDai.dart';

void main () {
  List<HoaDon> dshd = [];
  void NhapHD() {
    stdout.write('Hay nhap vao so luong hoa don: ');
    int n = int.parse(stdin.readLineSync()!);
    HoaDon? hd;
    for (int i = 0; i < n; i++) {
      print("\n--- Nhap thong tin thu ${i + 1}");
      print("1. Khach hang la ca nhan");
      print("2. Dai ly cap 1");
      print("3. Khach hang la cong ty");
      stdout.write("Nhap lua cho cua ban: ");
      int chon = int.parse(stdin.readLineSync()!);
      switch (chon) {
        case 1:
          hd = new KhachHangCaNhan();
          break;
        case 2:
          hd = new Dailycap1();
          break;
        case 3:
          hd = new KhachHangLaCongTy();
          break;
        default:
          print("Lua chon khong hop le");
          break;
      }

      if (hd != null) {
        hd.Nhap();
        dshd.add(hd);
      }
    }
  }

  void XuatHD() {
    print('======Bang ket qua====');
    for (var x in dshd) {
      x.Xuat();
    }
  }
  void TongThanhTien ()
  {
    double tong = 0;
    for (var n in dshd)
      {
        tong += n.ThanhTien();
      }
    print ('Tong thanh tien: ${tong}');
  }
  void TongTroGia ()
  {
    double tong = 0;
    for (var n in dshd)
    {
      if (n is ITroGia)
        {
          tong += (n as ITroGia).HoTro();
        }
    }
    print ('Tong tro gia: ${tong}');
  }
  void KhachHangMuaNhieuNhat() {
    if (dshd.isEmpty) return;
    HoaDon maxHD = dshd[0];
    for (int i = 1; i < dshd.length; i++) {
      if (dshd[i].soluong > maxHD.soluong) {
        maxHD = dshd[i];
      }
    }
    print("--- Thong tin khach hang mua nhieu nhat ---");
    maxHD.Xuat();
  }
  void TongSoTienChietKhau()
  {
    double tong = 0;
    for (var n in dshd)
      {
        if (n is KhachHangLaCongTy)
          {
            tong += n.ChietKhau();
          }
      }
    print ('Tong chiet khau voi khach hang la cong ty: ${tong}');
  }
  void SapXepVaHienThi() {
    dshd.sort((a, b) {
      int compareSL = a.soluong.compareTo(b.soluong);
      if (compareSL != 0) {
        return compareSL;
      }
      return b.ThanhTien().compareTo(a.ThanhTien());
    });
    print('--- Danh sach sau khi sap xep ---');
    for (var ds in dshd) {
      ds.Xuat();
      print('---------------------------------');
    }
  }
  void TimKiem() {
    stdout.write('Hay nhap vao ma khach hang can tim: ');
    String ma = stdin.readLineSync()!;
    bool timThay = false;

    for (var n in dshd) {
      if (n.makh == ma) {
        n.Xuat();
        timThay = true;
        break;
      }
    }
    if (!timThay) {
      print('Khong tim thay khach hang co ma: $ma');
    }
  }
  NhapHD();
  XuatHD();
  print('==========Tong thanh tien========)');
  TongThanhTien();
  print('==========Tong tro gia========)');
  TongTroGia();
  print('==========Khach hang co so luong mua nhieu nhat========)');
  KhachHangMuaNhieuNhat();
  print('==========Tong chiet khau voi khach hang la cong ty========)');
  TongSoTienChietKhau();
  SapXepVaHienThi();
  print('==========Tim Kiem========)');
  TimKiem();
}