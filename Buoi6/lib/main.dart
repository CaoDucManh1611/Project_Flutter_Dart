import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import các Provider
import 'provider/sinhvien_provider.dart';
import 'provider/todo_provider.dart';
import 'provider/chi_tieu_provider.dart';

// Import các View
import 'view/v_todo.dart';
import 'view/v_sinhvien.dart';
import 'view/v_sanpham.dart';
import 'view/v_chi_tieu.dart';
import 'view/v_kiemtra.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SinhVienProvider()..loadSinhViens()),
        ChangeNotifierProvider(create: (_) => TodoProvider()..loadTodos()),
        ChangeNotifierProvider(create: (_) => ChiTieuProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản Lý Tổng Hợp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Sửa chỗ này để hiện thẳng 4 lựa chọn khi vừa mở app
      home: const MainMenuScreen(),
    );
  }
}

// Màn hình Menu chính - Nơi để người dùng chọn vào các class bạn đã viết
class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MENU CHỨC NĂNG"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: [
            _buildItem(context, "Quản lý Todo", Icons.list_alt, Colors.blue, const TodoScreen()),
            _buildItem(context, "Sinh Viên", Icons.people, Colors.orange, const SinhVienListScreen()),
            _buildItem(context, "Sản Phẩm", Icons.shopping_bag, Colors.red, const SanPhamScreen()),
            _buildItem(context, "Chi Tiêu", Icons.account_balance_wallet, Colors.green, const ChiTieuScreen()),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, String title, IconData icon, Color color, Widget screen) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 10),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }
}