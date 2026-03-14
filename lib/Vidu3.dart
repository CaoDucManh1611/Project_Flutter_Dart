import 'package:flutter/material.dart';

class ViDu3 extends StatelessWidget {
  const ViDu3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stack Demo",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        backgroundColor: Colors.orange[600],
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            print('Quay ve nha');
          },
        ),
        elevation: 0,
      ),

      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(40),
              image: const DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
          left: 20,
            right: 20,
            child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
              height: 150,
              child: const Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(
                    'Động Phong Nha',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8),
                  child:Text('Động Phong Nha, nằm trong vườn quốc gia Phong Nha - Kẽ Bàng, tỉnh Quảng Bình, Việt Nam, là một trong những hang động nổi tiếng nhất trên thé giới',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}