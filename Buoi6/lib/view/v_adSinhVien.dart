import 'package:flutter/material.dart';
import '../model/sinhvien.dart';
import 'package:provider/provider.dart';
import '../provider/sinhvien_provider.dart';

class AddSinhVien extends StatefulWidget {
  const AddSinhVien({super.key});

  @override
  State<AddSinhVien> createState() => _AddSinhVienState();
}

class _AddSinhVienState extends State<AddSinhVien> {
  final TextEditingController _txtTen = TextEditingController();
  final TextEditingController _txtEmail = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _txtTen.dispose();
    _txtEmail.dispose();
    super.dispose();
  }

  void _saveSinhVien() {
    String name = _txtTen.text.trim();
    String email = _txtEmail.text.trim();

    if (name.isEmpty || email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Vui lòng nhập đầy đủ thông tin")),
      );
      return;
    }

    final provider = Provider.of<SinhVienProvider>(context, listen: false);
    provider.addSinhVien(SinhVien(name: name, email: email));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Lưu sinh viên thành công!")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm sinh viên mới'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _saveSinhVien,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _txtTen,
              decoration: const InputDecoration(
                labelText: "Nhập tên",
                hintText: "Ví dụ: Nguyen Van A",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _txtEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Nhập email",
                hintText: "Ví dụ: a@example.com",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: _saveSinhVien,
                icon: const Icon(Icons.save),
                label: const Text("LƯU THÔNG TIN"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}