import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/chi_tieu_provider.dart';
import '../model/chi_tieu.dart';

class ChiTieuScreen extends StatelessWidget {
  const ChiTieuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quản Lý Chi Tiêu"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.green.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Tổng chi tiêu:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Consumer<ChiTieuProvider>(
                  builder: (context, provider, child) => Text(
                    "${provider.tongChiTieu.toStringAsFixed(0)} VNĐ",
                    style: const TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<ChiTieuProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  itemCount: provider.dsChiTieu.length,
                  itemBuilder: (context, index) {
                    final item = provider.dsChiTieu[index];
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.money_off, color: Colors.red),
                        title: Text(item.noiDung, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text("Ghi chú: ${item.ghiChu}"),
                        trailing: Text("-${item.soTien.toStringAsFixed(0)}đ",
                            style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context),
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    final _noiDung = TextEditingController();
    final _soTien = TextEditingController();
    final _ghiChu = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Thêm mục chi tiêu"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _noiDung, decoration: const InputDecoration(labelText: "Nội dung")),
            TextField(controller: _soTien, decoration: const InputDecoration(labelText: "Số tiền"), keyboardType: TextInputType.number),
            TextField(controller: _ghiChu, decoration: const InputDecoration(labelText: "Ghi chú")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Hủy")),
          ElevatedButton(
            onPressed: () {
              context.read<ChiTieuProvider>().addChiTieu(ChiTieu(
                noiDung: _noiDung.text,
                soTien: double.tryParse(_soTien.text) ?? 0,
                ghiChu: _ghiChu.text,
              ));
              Navigator.pop(context);
            },
            child: const Text("Lưu"),
          ),
        ],
      ),
    );
  }
}