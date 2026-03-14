import 'package:flutter/material.dart';

class BaiTap3 extends StatelessWidget {
  const BaiTap3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800], // Nền xanh cho toàn màn hình
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // --- PHẦN 1: HEADER (MÀU XANH) ---
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  // Lời chào và Icon chuông
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Hi, Jared!', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('23 Jan, 2021', style: TextStyle(color: Colors.blueAccent)),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.blue[600], borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(12),
                        child: const Icon(Icons.notifications, color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  // Thanh Search
                  Container(
                    decoration: BoxDecoration(color: Colors.blue[600], borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(width: 5),
                        Text('Search', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Câu hỏi cảm xúc
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('How do you feel?', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      Icon(Icons.more_horiz, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 25),
                  // Danh sách icon cảm xúc
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildEmojiIcon('😩', 'Bad'),
                      _buildEmojiIcon('😊', 'Fine'),
                      _buildEmojiIcon('😁', 'Well'),
                      _buildEmojiIcon('🤩', 'Excellent'),
                    ],
                  ),
                ],
              ),
            ),

            // --- PHẦN 2: BODY (MÀU TRẮNG/XÁM) ---
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  color: Color(0xFFF8F9FB), // Màu trắng xám nhạt
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Exercises', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                        Icon(Icons.more_horiz),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Danh sách bài tập
                    Expanded(
                      child: ListView(
                        children: [
                          _buildExerciseTile(Icons.favorite, Colors.orange, 'Speaking Skillz', '16 Exercises'),
                          _buildExerciseTile(Icons.person, Colors.green, 'Reading Skills', '8 Exercises'),
                          _buildExerciseTile(Icons.star, Colors.pink, 'Writing Skills', '20 Exercises'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hàm tạo icon cảm xúc
  Widget _buildEmojiIcon(String emoji, String text) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.blue[600], borderRadius: BorderRadius.circular(12)),
          child: Text(emoji, style: const TextStyle(fontSize: 28)),
        ),
        const SizedBox(height: 8),
        Text(text, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  // Hàm tạo mỗi dòng bài tập
  Widget _buildExerciseTile(IconData icon, Color color, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.more_horiz),
      ),
    );
  }
}