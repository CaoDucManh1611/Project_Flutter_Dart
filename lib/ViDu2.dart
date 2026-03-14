import 'package:flutter/material.dart';

class ViDu2 extends StatelessWidget {
  const ViDu2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Column and row demo",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        backgroundColor: Colors.orange[600],
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            print("Bấm để quay lại");
          },
        ),
        elevation: 0,
      ),

      body: Center( // Center giúp cả khối Column nằm giữa màn hình
        child: Column( // Dùng Column để chứa nhiều con theo hàng dọc
          mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều dọc
          children: <Widget>[
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green[500],
                border: Border.all(color: Colors.black, width: 1),
              ),
            ),
            Container(
              color: Colors.red,
              width: 100,
              height: 50,
            ),
            Container(
              color: Colors.blue,
              width: 100,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}