import 'package:flutter/material.dart';
import 'Bai1.dart';
import 'Bai2.dart';
import 'Bai3.dart';
import 'Bai4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Học Flutter - IUH',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Màn hình mặc định sẽ là Menu để chọn bài
      home: const MenuTongHop(),
    );
  }
}

class MenuTongHop extends StatelessWidget {
  const MenuTongHop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tổng hợp Bài tập Buổi 5"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuCard(context, "Bài tập 01", "ListView Demo & Chuyên ngành", const Bai1()),
          _buildMenuCard(context, "Bài tập 02", "Mô phỏng giao diện MoMo", const Bai2()),
          _buildMenuCard(context, "Bài tập 03", "Danh sách Voucher / Quà tặng", const Bai3()),
          _buildMenuCard(context, "Bài tập 04", "Ứng dụng mua bán điện thoại", const Bai4()),
        ],
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, String subtitle, Widget screen) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: const CircleAvatar(child: Icon(Icons.code)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }
}