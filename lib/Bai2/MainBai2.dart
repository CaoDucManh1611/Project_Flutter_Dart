import 'dart:io';
import 'package:buoi2/Bai2/DoAn.dart';
import 'package:buoi2/Bai2/LyThuyet.dart';
import 'package:buoi2/Bai2/MonHoc.dart';
import 'package:buoi2/Bai2/ThucHanh.dart';

void main ()
{
  List<MonHoc> dsmh = [];
  void DocFile() {
    try {
      File f = File('lib/Bai2/monhoc.txt');
      if (f.existsSync()) {
        List<String> lines = f.readAsLinesSync();
        for (var line in lines) {
          var data = line.split(',');
          if (data.length >= 6) {
            // Giả sử định dạng file: Loai,Ma,Ten,SoTC,Diem1,Diem2
            dsmh.add(Lythuyet.fullpare(data[1], data[2], int.parse(data[3]), double.parse(data[4]), double.parse(data[5])));
          }
        }
        print('Da doc du lieu tu file monhoc.txt');
      } else {
        print('Khong tim thay file monhoc.txt để đọc.');
      }
    } catch (e) {
      print('Loi doc file: $e');
    }
  }
  void TinhTinChiTrungBinh() {
    if (dsmh.isEmpty) {
      print('Danh sach trong, khong the tinh trung binh.');
      return;
    }
    double tong = 0;
    int count = 0;
    for (var mh in dsmh) {
      tong += mh.sotc;
      count ++;
    }
    double trungBinh = tong / count;
    print('==> So tin chi trung binh cua cac mon hoc: ${trungBinh}');
  }
  void NhapMH ()
  {
    stdout.write('Hay nhap vao so luong mon hoc: ');
    int n = int.parse(stdin.readLineSync()!);
    MonHoc? mh;
    for (int i = 0; i < n; i++) {
      print("\n--- Nhap thong tin thu ${i+1}");
      print("1. Mon Ly Thuyet");
      print("2. Mon Thuc Hanh");
      print("3. Mon Do An");
      stdout.write("Nhap lua cho cua ban: ");
      int chon = int.parse(stdin.readLineSync()!);
      switch (chon) {
        case 1:
        // Khoi tao mac dinh roi goi Nhap()
          mh = new Lythuyet.fullpare('Null', 'Null', 0, 0.0, 0.0);
          break;
        case 2:
          mh = new ThucHanh.fullpare('Null', 'Null', 0, 0.0, 0.0, 0.0);
          break;
        case 3:
          mh = new DoAn.fullpare('Null', 'Null', 0, 0.0, 0.0);
          break;
        default:
          print("Lua chon khong hop le");
          break;
      }

      if (mh != null) {
        mh.Nhap();
        dsmh.add(mh);
      }
    }

  }

  void Xuat ()
  {
    print('======Bang ket qua====');
    for (var nv in dsmh)
    {
      nv.Xuat();
    }
  }
  int KiemTraTangdan (List<MonHoc> dsmh)
  {

    for (int i=0; i<dsmh.length-1; i++)
      {
        if (dsmh[i].tenmh.compareTo(dsmh[i+1].tenmh)>0)
          {
            return 0;
          }
      }
    return 1;
  }
  void Check ()
  {
    if (KiemTraTangdan(dsmh)==1)
    {
      print('chuoi tang dan theo ten mon hoc');
    }
    else
    {
      print('chuoi ko tang dan theo ten mon hoc');
    }
  }
  dsmh.sort((a,b)=>a.sotc.compareTo(b.sotc));
  void TangDanSoTinChi () {
  for (var ds in dsmh)
    {
      ds.Xuat();
    }
  }
  void MonHocSoTinCaoNhat ()
  {
    MonHoc Max = dsmh[0];
    for (int i=0; i<dsmh.length; i++)
      {
        if (dsmh[i].sotc > Max.sotc)
          {
            Max.sotc = dsmh[i].sotc;
          }
      }
    print('Mon hoc co so tin chi cao nhat: ');
    Max.Xuat();
  }
  void TimKiem ()
  {
    stdout.write('Hay nhap vao ten mon: ');
    String mon = stdin.readLineSync()!;
    MonHoc? ketQua;
    for (var n in dsmh) {
      if (mon == n.tenmh) {
        ketQua = n;
        break;
      }
    }
    if (ketQua != null) {
      ketQua.Xuat();
    }
    else {
      print('Khong tim thay. Dang tien hanh them mon "$mon" vao danh sach...');
      MonHoc monMoi = Lythuyet.fullpare('Moi', mon, 0, 0.0, 0.0);
      monMoi.Nhap();
      dsmh.add(monMoi);
      print('Da them mon hoc moi thanh cong.');
    }
  }

  DocFile();
  print('---Ket qua cua nhap ---');
  NhapMH();
  Xuat();
  TinhTinChiTrungBinh();
  print('--- Danh sach sau khi sap xep TANG DAN so tin chi ---');
  TangDanSoTinChi();
  Check();
  MonHocSoTinCaoNhat();
  TimKiem();
  Xuat();


}