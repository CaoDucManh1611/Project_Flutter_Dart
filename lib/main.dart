import 'package:flutter/material.dart';
// Giữ nguyên các import của bạn
import 'ViDu1.dart';
import 'ViDu2.dart';
import 'ViDu3.dart';
import 'BaiTap1.dart';
import 'BaiTap2.dart';
import 'BaiTap3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Tắt dải băng debug cho đẹp
      title: 'HUIT Flutter Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MenuScreen(), // Chạy màn hình Menu đầu tiên
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  // Hàm tiện ích để điều hướng (Navigator)
  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh Sách Bài Tập'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuHeader('Ví Dụ Cơ Bản'),
          _buildMenuItem(context, 'Ví Dụ 1: Container & Decoration', const ViDu1(), Icons.looks_one),
          _buildMenuItem(context, 'Ví Dụ 2: Column & Row', const ViDu2(), Icons.looks_two),
          _buildMenuItem(context, 'Ví Dụ 3: Stack & Assets', const ViDu3(), Icons.looks_3),

          const Divider(height: 40),

          _buildMenuHeader('Bài Tập Về Nhà'),
          _buildMenuItem(context, 'Bài 1: Máy Tính Windows', const BaiTap1(), Icons.calculate),
          _buildMenuItem(context, 'Bài 2: Cơ Sở Vật Chất HUIT', const BaiTap2(), Icons.school),
          _buildMenuItem(context, 'Bài 3: Dashboard Jared', const BaiTap3(), Icons.dashboard),
        ],
      ),
    );
  }

  Widget _buildMenuHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, Widget screen, IconData icon) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue[900]),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => _navigateTo(context, screen),
      ),
    );
  }
}