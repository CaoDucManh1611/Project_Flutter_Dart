import 'package:buoi2/Bai1/PhongTro.dart';
import 'package:buoi2/Bai1/DocFile.dart';

void main() async {

  String path = 'lib/Bai1/phongthue.txt';
  List<PhongTro> ds = await docFilePhong(path);
  print("--- KẾT QUẢ TÍNH TIỀN ---");
  print("==="*20);
  print ('Xuat tong phong');
  for (var p in ds) {
    p.Xuat();
    // print("Phòng: ${p.masophong} - Tiền: ${p.TienPhong()} VNĐ");
  }
  print("==="*20);
  print ('Phong co nguoi thue > 2');
  for (var p in ds) {
    if (p.songuoi>2)
    {
      p.Xuat();
    }
    // print("Phòng: ${p.masophong} - Tiền: ${p.TienPhong()} VNĐ");

  }
  print("==="*20);
  double tong = 0.0;
  for (var p in ds)
  {
    tong += p.TienPhong();

  }
  print ('Tong tien phong: ${tong}');
  print("==="*20);
  print('Danh sach giam dan: ');
  ds.sort((a,b)=>b.sodien.compareTo(a.sodien));
  for (var x in ds)
    {
      x.Xuat();
    }
  print("==="*20);
  print('Danh sach phong loai a: ');
  for (var p in ds)
    {
      if (p.masophong.startsWith('A'))
        {
          p.Xuat();
        }
    }
}