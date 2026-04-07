import 'package:flutter/material.dart';
import '../model/sanpham.dart';

class SanPhamScreen extends StatefulWidget {
  const SanPhamScreen({super.key});

  @override
  State<SanPhamScreen> createState() => _SanPhamScreenState();
}

class _SanPhamScreenState extends State<SanPhamScreen> {
  final List<SanPham> _dsSanPham = [];

  final _txtMa = TextEditingController();
  final _txtTen = TextEditingController();
  final _txtGia = TextEditingController();
  final _txtGiamGia = TextEditingController();

  void _themSanPham() {
    if (_txtMa.text.isEmpty || _txtTen.text.isEmpty) return;

    setState(() {
      _dsSanPham.add(SanPham(
        ma: _txtMa.text,
        ten: _txtTen.text,
        gia: double.tryParse(_txtGia.text) ?? 0,
        giamGia: double.tryParse(_txtGiamGia.text) ?? 0,
      ));
    });

    _txtMa.clear(); _txtTen.clear(); _txtGia.clear(); _txtGiamGia.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quản Lý Sản Phẩm"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: _dsSanPham.isEmpty
          ? const Center(child: Text("Chưa có sản phẩm nào"))
          : ListView.builder(
        itemCount: _dsSanPham.length,
        itemBuilder: (context, index) {
          final sp = _dsSanPham[index];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mã SP: ${sp.ma}", style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text("Tên SP: ${sp.ten}", style: const TextStyle(fontSize: 18, color: Colors.blue)),
                  const Divider(),
                  Text("Đơn giá: ${sp.gia.toStringAsFixed(2)} VNĐ"),
                  Text("Giảm giá: ${sp.giamGia.toStringAsFixed(2)} VNĐ"),
                  Text(
                    "Thuế nhập khẩu (10%): ${sp.tinhThueNhapKhau().toStringAsFixed(2)} VNĐ",
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "TỔNG CỘNG: ${sp.tinhTongTien().toStringAsFixed(2)} VNĐ",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Thêm Sản Phẩm Mới"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: _txtMa, decoration: const InputDecoration(labelText: "Mã sản phẩm")),
              TextField(controller: _txtTen, decoration: const InputDecoration(labelText: "Tên sản phẩm")),
              TextField(controller: _txtGia, decoration: const InputDecoration(labelText: "Đơn giá"), keyboardType: TextInputType.number),
              TextField(controller: _txtGiamGia, decoration: const InputDecoration(labelText: "Giảm giá"), keyboardType: TextInputType.number),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Hủy")),
          ElevatedButton(onPressed: _themSanPham, child: const Text("Lưu")),
        ],
      ),
    );
  }
}