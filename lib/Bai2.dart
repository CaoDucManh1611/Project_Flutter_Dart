import 'package:flutter/material.dart';

class Bai2 extends StatelessWidget {
  const Bai2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink[600],
        title: const Text('Mô phỏng MoMo', style: TextStyle(color: Colors.white)),
        actions: const [Icon(Icons.notifications_none, color: Colors.white), SizedBox(width: 10)],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Grid Menu chính
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children: [
                  _buildMenuItem(Icons.send, "Chuyển tiền", Colors.red),
                  _buildMenuItem(Icons.receipt_long, "Thanh toán hóa đơn", Colors.teal),
                  _buildMenuItem(Icons.phone_android, "Nạp tiền điện thoại", Colors.blue),
                  _buildMenuItem(Icons.shopping_bag, "Mua mã thẻ di động", Colors.orange),
                  _buildMenuItem(Icons.savings, "Heo Đất MoMo", Colors.pink),
                  _buildMenuItem(Icons.directions_walk, "Đi bộ cùng MoMo", Colors.green),
                  _buildMenuItem(Icons.water_drop, "Thanh toán nước", Colors.blueAccent),
                  _buildMenuItem(Icons.bar_chart, "Quản lý chi tiêu", Colors.cyan),
                  _buildMenuItem(Icons.groups, "Quỹ nhóm", Colors.purple),
                  _buildMenuItem(Icons.trending_up, "Chứng khoán", Colors.indigo),
                  _buildMenuItem(Icons.mail, "Vietlott SMS", Colors.redAccent),
                  _buildMenuItem(Icons.grid_view, "Xem thêm dịch vụ", Colors.grey),
                ],
              ),
            ),

            // 2. Banner "Sự kiện đang diễn ra"
            _buildSectionTitle("Sự kiện đang diễn ra"),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: NetworkImage('https://via.placeholder.com/400x120'), // Thay bằng link ảnh thật
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // 3. MoMo đề xuất
            _buildSectionTitle("MoMo đề xuất"),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15),
                children: [
                  _buildSuggestItem(Icons.attach_money, "Vay Nhanh"),
                  _buildSuggestItem(Icons.movie, "Mua vé xem..."),
                  _buildSuggestItem(Icons.account_balance_wallet, "Túi Thần Tài"),
                  _buildSuggestItem(Icons.credit_card, "Ví Trả Sau"),
                ],
              ),
            ),

            // 4. Banner phụ (2025 nhờ ai mà nở hoa)
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.orangeAccent),
              ),
              child: Row(
                children: [
                  const Icon(Icons.emoji_emotions, color: Colors.orange),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text("2025 nhờ ai mà nở hoa?\nGieo quẻ với AI, tìm quý nhân của bạn"),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(backgroundColor: Colors.pink, foregroundColor: Colors.white),
                    child: const Text("Gieo ngay"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),

      // 5. Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'MoMo'),
          BottomNavigationBarItem(icon: Icon(Icons.percent), label: 'Ưu đãi'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner, size: 40), label: 'Quét mã'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Lịch sử GD'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tôi'),
        ],
      ),
    );
  }

  // Widget con cho từng Icon Menu
  Widget _buildMenuItem(IconData icon, String label, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 30),
        const SizedBox(height: 8),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11)),
      ],
    );
  }

  // Widget tiêu đề các phần
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  // Widget item đề xuất
  Widget _buildSuggestItem(IconData icon, String label) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(backgroundColor: Colors.orange[50], child: Icon(icon, color: Colors.orange)),
          const SizedBox(height: 5),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11), maxLines: 1),
        ],
      ),
    );
  }
}