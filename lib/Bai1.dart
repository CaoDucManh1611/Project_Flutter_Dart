import 'package:flutter/material.dart';

class Bai1 extends StatelessWidget {
  const Bai1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: const Icon(Icons.home, color: Colors.black),
        title: const Text('ListView Demo', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [

          _buildHeaderSection("Chọn loại đề tài"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCircleCategory("Đồ án"),
                _buildCircleCategory("KLKS"),
                _buildCircleCategory("Luận văn"),
                _buildCircleCategory("Khác"),
              ],
            ),
          ),


          _buildHeaderSection("Chọn chuyên ngành thực hiện"),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                _buildMajorItem("Công nghệ phần mềm", "Phát triển các ứng dụng giải quyết các vấn đề thực tế"),
                _buildMajorItem("Hệ thống thông tin", "Phát triển các kỹ thuật xử lý thông tin trong tổ chức"),
                _buildMajorItem("Mạng máy tính", "Xử lý các vấn đề liên quan đến mạng máy tính"),
                _buildMajorItem("An toàn thông tin", "Thiết kế và đảm bảo an toàn cho hệ thống máy tính"),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildHeaderSection(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      color: Colors.blue,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }


  Widget _buildCircleCategory(String label) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }


  Widget _buildMajorItem(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black54),
      ),
      child: ListTile(
        leading: const Icon(Icons.home, color: Colors.black54),
        title: Text(
          title,
          style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {

        },
      ),
    );
  }
}