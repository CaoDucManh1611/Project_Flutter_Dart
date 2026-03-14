import 'package:flutter/material.dart';

class BaiTapVN3 extends StatelessWidget {
  const BaiTapVN3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // 1. Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNeumorphicButton(Icons.arrow_back),
                  const Text('P L A Y L I S T', style: TextStyle(letterSpacing: 2)),
                  _buildNeumorphicButton(Icons.menu),
                ],
              ),
              const SizedBox(height: 25),

              // 2. Album Cover Card
              Container(
                padding: const EdgeInsets.all(8),
                decoration: _neumorphicDecoration(),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/en/3/3b/Kota_the_Friend_-_Everything.jpg', // Link ảnh mẫu
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Kota The Friend', style: TextStyle(color: Colors.grey[700], fontSize: 18)),
                              const Text('Birdie', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                            ],
                          ),
                          const Icon(Icons.favorite, color: Colors.red, size: 32),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // 3. Time & Shuffle/Repeat
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text('0:00'),
                  Icon(Icons.shuffle),
                  Icon(Icons.repeat),
                  Text('4:22'),
                ],
              ),
              const SizedBox(height: 25),

              // 4. Progress Bar
              Container(
                padding: const EdgeInsets.all(8),
                decoration: _neumorphicDecoration(),
                child: LinearProgressIndicator(
                  value: 0.4,
                  backgroundColor: Colors.grey[300],
                  color: Colors.green,
                  minHeight: 10,
                ),
              ),
              const SizedBox(height: 40),

              // 5. Playback Controls
              Row(
                children: [
                  Expanded(child: _buildNeumorphicButton(Icons.skip_previous, size: 80)),
                  const SizedBox(width: 20),
                  Expanded(child: _buildNeumorphicButton(Icons.play_arrow, size: 80, isPlay: true)),
                  const SizedBox(width: 20),
                  Expanded(child: _buildNeumorphicButton(Icons.skip_next, size: 80)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Hàm tạo decoration đổ bóng kiểu Neumorphism
  BoxDecoration _neumorphicDecoration() {
    return BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(color: Colors.grey.shade500, offset: const Offset(4, 4), blurRadius: 15, spreadRadius: 1),
        const BoxShadow(color: Colors.white, offset: Offset(-4, -4), blurRadius: 15, spreadRadius: 1),
      ],
    );
  }

  // Widget con cho nút bấm nổi
  Widget _buildNeumorphicButton(IconData icon, {double size = 60, bool isPlay = false}) {
    return Container(
      height: size,
      width: size,
      decoration: _neumorphicDecoration(),
      child: Icon(icon, size: isPlay ? 35 : 25),
    );
  }
}