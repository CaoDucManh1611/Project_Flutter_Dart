class SanPham {
  String ma;
  String ten;
  double gia;
  double giamGia;

  SanPham({
    required this.ma,
    required this.ten,
    required this.gia,
    required this.giamGia,
  });

  double tinhThueNhapKhau() {
    return gia * 0.1;
  }

  double tinhTongTien() {
    return gia - giamGia + tinhThueNhapKhau();
  }
}