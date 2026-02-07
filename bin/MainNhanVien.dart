import 'package:buoi2/NhanVien/CanBoQuanLy.dart';
import 'package:buoi2/NhanVien/NhanVien.dart';
import 'package:buoi2/SanPham/SanPham.dart';

void main ()
{
  List <NhanVien> dsnv = [];
  NhanVien nv = new NhanVien.fullpare('NV01', 'Cao Duc Manh', 2.0, 'Phong hanh chinh', 100.0);
  CanBo nv2 = new CanBo.fullpare('NV02', 'Toan', 1.0, 'Phong cu', 23, 'Quan ly', 10.0);
  NhanVien nv3 = new NhanVien.fullpare('NV03', 'Ngo Long Thien', 1.5, 'Phong hanh chinh', 20.0);
  dsnv.add(nv);
  dsnv.add(nv2);
  dsnv.add(nv3);
  for (NhanVien i in dsnv)
    {
      print(i);
    }
  List <NhanVien> lsta = dsnv.where((a) => a.XepLoai() == "A").toList();
  print ('Nhan vien xep loai A');
  for (var x in lsta)
    {
      print(x);
    }
}
