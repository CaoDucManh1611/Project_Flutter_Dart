import 'package:flutter/material.dart';

class ViDu1 extends StatelessWidget {
  const ViDu1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Thuộc tính title nhận một Widget (Text)
        title: const Text(
          "Container Demo",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        // Các thuộc tính dưới đây phải nằm ngoài Text, thuộc về AppBar
        backgroundColor: Colors.orange[600],
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
        print("Bấm để quay lại");
      },
    ),
        elevation: 0,
      ), // Đóng AppBar tại đây

      body: Center(
        child: Container(
          width: 100,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.green[500], // Đổi sang xanh lá cho giống hình mẫu
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(5, 5),
                blurRadius: 4,
              )
            ],
          ),
          child: const Text("OK"),
        ),
      ),
    ); // Đóng Scaffold tại đây
  }
}