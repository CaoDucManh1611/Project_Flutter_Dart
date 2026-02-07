import 'package:buoi2/SanPham/SanPham.dart';

void main ()
{
  List <SanPham> dssp = [];
  SanPham sp1 = new SanPham.fullpara('Mh001', 'Sua tam', 100000.0, 10000.0);
  SanPham sp2 = new SanPham.fullpara('Mh002', 'Dau goi', 15000.0, 0.0);
  SanPham sp3 = new SanPham.fullpara('Mh003', 'Xa bong', 12000.0, 0.0);
  dssp.add(sp1);
  dssp.add(sp2);
  dssp.add(sp3);
  print ('Danh sach san pham: ');
  for (var i in dssp)
    {
      i.showinfo();
    }

}
