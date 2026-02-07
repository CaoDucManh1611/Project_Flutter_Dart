import 'dart:io';
import 'package:buoi2/Bai1/PhongTro.dart';
import 'package:buoi2/Bai1/PhongloaiA.dart';
import 'package:buoi2/Bai1/PhongloaiB.dart';

Future<List<PhongTro>> docFilePhong(String path) async {
  List<PhongTro> ds = [];
  try {
    final file = File(path);
    // Đọc tất cả các dòng trong file
    List<String> lines = await file.readAsLines();

    for (String line in lines) {
      if (line.trim().isEmpty) continue; // Bỏ qua dòng trống

      // Tách dữ liệu dựa trên dấu #
      List<String> p = line.split('#');
      String ma = p[0];
      int nguoi = int.parse(p[1]);
      double dien = double.parse(p[2]);
      double nuoc = double.parse(p[3]);

      // Kiểm tra mã để phân loại
      if (ma.startsWith('A')) {
        // Phòng A: 5 tham số (số người thân ở vị trí p[4])
        int nguoiThan = int.parse(p[4]);
        ds.add(PhongloaiA.fullpare(ma, nguoi, dien, nuoc, nguoiThan));
      } else if (ma.startsWith('B')) {
        // Phòng B: 6 tham số (giá túi p[4], số máy p[5])
        double giaTui = double.parse(p[4]);
        int soMay = int.parse(p[5]);
        ds.add(PhongloaiB.fullpare(ma, nguoi, dien, nuoc, giaTui, soMay));
      }
    }
  } catch (e) {
    print("Lỗi khi đọc file: $e");
  }
  return ds;
}