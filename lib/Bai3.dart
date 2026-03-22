import 'package:flutter/material.dart';

class Bai3 extends StatelessWidget {
  const Bai3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text('Quà của Vinh (7)', style: TextStyle(color: Colors.black, fontSize: 16)),
        actions: const [
          Icon(Icons.headset_mic_outlined, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.cancel_outlined, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          // 1. Thanh lọc (Filter Chips)
          _buildFilterBar(),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                // 2. Banner Xu và Quà
                _buildPointsBanner(),
                const SizedBox(height: 15),

                // 3. Danh sách Voucher
                _buildVoucherItem("CGV - Đồng giá 79K khi mua vé...", "HSD: 28/02/2025", "CGV", Colors.red, true),
                _buildVoucherItem("Giảm 100K cho đơn từ 0đ", "HSD: 28/02/2025", "Mua Sim", Colors.pink, false, isFavorite: true),
                _buildVoucherItem("Tặng 100k khi mở thẻ VIB...", "HSD: 31/03/2025", "VIB", Colors.blue, true),
                _buildVoucherItem("Hoàn 15K cho hóa đơn...", "Hết hạn sau 5 ngày", "Bảo hiểm", Colors.lightBlue, true),
                _buildVoucherItem("Giảm 10K cho đơn từ 100K", "KM đa tầng", "Phí không dừng", Colors.orange, false, btnText: "Thu thập"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBar() {
    return Container(
      color: Colors.white,
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          _filterChip(Icons.filter_list, ""),
          _filterChip(null, "Sắp xếp"),
          _filterChip(null, "Dịch vụ"),
          _filterChip(null, "Gần tôi"),
          _filterChip(null, "Yêu thích"),
        ],
      ),
    );
  }

  Widget _filterChip(IconData? icon, String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          if (icon != null) Icon(icon, size: 18),
          if (label.isNotEmpty) Text(label, style: const TextStyle(fontSize: 13)),
          if (label == "Sắp xếp" || label == "Dịch vụ") const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  Widget _buildPointsBanner() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: const Row(
              children: [
                Icon(Icons.monetization_on, color: Colors.orange),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Đang có", style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text("1.955 Xu", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Spacer(),
                Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.blue[800], borderRadius: BorderRadius.circular(12)),
            child: const Row(
              children: [
                Icon(Icons.card_giftcard, color: Colors.white),
                SizedBox(width: 8),
                Text("Bỏ túi ngay\n4 thẻ quà", style: TextStyle(color: Colors.white, fontSize: 12)),
                Spacer(),
                Icon(Icons.arrow_circle_right, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVoucherItem(String title, String expiry, String brand, Color color, bool hasIcon, {bool isFavorite = false, String btnText = "Dùng ngay"}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Cột bên trái (Logo thương hiệu)
            Container(
              width: 100,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(Icons.store, color: color)),
                  const SizedBox(height: 5),
                  Text(brand, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11)),
                ],
              ),
            ),
            const VerticalDivider(width: 1, thickness: 1, color: Colors.black12),
            // Cột bên phải (Thông tin voucher)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis)),
                        Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.pink, size: 18),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(expiry, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(btnText, style: const TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}