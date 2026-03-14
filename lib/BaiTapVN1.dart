import 'package:flutter/material.dart'; // Phải có dòng này thì Flutter mới chạy được

class BaiTapVN1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // 1. Header: My Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 26, color: Colors.black),
                      children: [
                        TextSpan(text: 'My ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Cards'),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(color: Colors.grey[400], shape: BoxShape.circle),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(height: 25),

              // 2. Purple Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[400],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Balance', style: TextStyle(color: Colors.white, fontSize: 16)),
                    SizedBox(height: 10),
                    Text('\$5250.25', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('12345678', style: TextStyle(color: Colors.white)),
                        Text('10/24', style: TextStyle(color: Colors.white)),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 25),

              // 3. Buttons (Send, Pay, Bills)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMenuButton(Icons.account_balance_wallet, 'Send', Colors.green),
                  _buildMenuButton(Icons.payment, 'Pay', Colors.blue),
                  _buildMenuButton(Icons.receipt_long, 'Bills', Colors.orange),
                ],
              ),
              SizedBox(height: 35),

              // 4. List Options (Statistics, Transactions)
              _buildListOption(Icons.bar_chart, 'Statistics', 'Payment and Income'),
              _buildListOption(Icons.swap_horiz, 'Transactions', 'Transaction History'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(Icons.monetization_on, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // Widget con cho nút Menu
  Widget _buildMenuButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 2, blurRadius: 5)],
          ),
          child: Icon(icon, color: color, size: 30),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700])),
      ],
    );
  }

  // Widget con cho danh sách bên dưới
  Widget _buildListOption(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: Colors.blue[800]),
          ),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ),
    );
  }
}