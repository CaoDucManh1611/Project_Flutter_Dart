import 'package:flutter/material.dart';

class BaiTap2 extends StatefulWidget {
  const BaiTap2({super.key});

  @override
  State<BaiTap2> createState() => _BaiTap2State();
}

class _BaiTap2State extends State<BaiTap2> {
  // 1. Biến lưu chỉ số của tab đang chọn
  int _selectedIndex = 0;

  // 2. Danh sách các màn hình tương ứng với từng tab
  static const List<Widget> _pages = <Widget>[
    // Tab 1: Trang chủ
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.school, size: 100, color: Colors.blue),
          Text('Chào mừng đến với HUIT',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Trường Đại học Công thương TP.HCM với cơ sở vật chất hiện đại.',
                textAlign: TextAlign.center),
          ),
        ],
      ),
    ),
    // Tab 2: Phòng học
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.meeting_room, size: 100, color: Colors.orange),
          Text('Hệ thống phòng học',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('Phòng học máy lạnh, trang bị projector và âm thanh chuẩn.'),
        ],
      ),
    ),
    // Tab 3: Thư viện
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.menu_book, size: 100, color: Colors.green),
          Text('Thư viện HUIT',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('Hàng ngàn đầu sách và không gian tự học yên tĩnh.'),
        ],
      ),
    ),
  ];

  // 3. Hàm xử lý khi người dùng chọn tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cơ sở vật chất HUIT'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      // Hiển thị màn hình tương ứng với tab được chọn
      body: _pages[_selectedIndex],

      // --- THÀNH PHẦN CHÍNH CỦA BÀI TẬP ---
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Phòng học',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Thư viện',
          ),
        ],
        currentIndex: _selectedIndex, // Tab hiện tại
        selectedItemColor: Colors.blue[900], // Màu khi được chọn
        onTap: _onItemTapped, // Gọi hàm khi bấm vào
      ),
    );
  }
}