class ChiTieu {
  final int? id;
  final String noiDung;
  final double soTien;
  final String ghiChu;

  ChiTieu({this.id, required this.noiDung, required this.soTien, required this.ghiChu});

  Map<String, dynamic> toMap() {
    return {'id': id, 'noiDung': noiDung, 'soTien': soTien, 'ghiChu': ghiChu};
  }

  factory ChiTieu.fromMap(Map<String, dynamic> map) {
    return ChiTieu(
      id: map['id'],
      noiDung: map['noiDung'],
      soTien: map['soTien'],
      ghiChu: map['ghiChu'],
    );
  }
}