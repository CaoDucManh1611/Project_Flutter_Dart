import 'package:flutter/material.dart';
import 'dart:math';

class BaiTap1 extends StatefulWidget {
  const BaiTap1({super.key});

  @override
  State<BaiTap1> createState() => _BaiTap1State();
}

class _BaiTap1State extends State<BaiTap1> {
  String display = "0";
  double num1 = 0;
  String operand = "";
  bool shouldReset = false;

  void onButtonClick(String label) {
    setState(() {
      double currentNum = double.tryParse(display) ?? 0;

      if (label == "C" || label == "CE") {
        display = "0";
        num1 = 0;
        operand = "";
      } else if (label == "⌫") {
        if (display.length > 1) {
          display = display.substring(0, display.length - 1);
        } else {
          display = "0";
        }
      } else if (label == "¹/x") {
        display = (1 / currentNum).toString();
      } else if (label == "x²") {
        display = (currentNum * currentNum).toString();
      } else if (label == "√x") {
        display = sqrt(currentNum).toString();
      } else if (label == "%") {
        display = (currentNum / 100).toString();
      } else if (label == "+/-") {
        display = (currentNum * -1).toString();
      } else if (label == "+" || label == "-" || label == "×" || label == "÷") {
        num1 = currentNum;
        operand = label;
        shouldReset = true;
      } else if (label == "=") {
        double num2 = currentNum;
        if (operand == "+") display = (num1 + num2).toString();
        if (operand == "-") display = (num1 - num2).toString();
        if (operand == "×") display = (num1 * num2).toString();
        if (operand == "÷") {
          display = num2 != 0 ? (num1 / num2).toString() : "Error";
        }
        operand = "";
        shouldReset = true;
      } else {
        if (display == "0" || shouldReset) {
          display = label;
          shouldReset = false;
        } else {
          if (label == "." && display.contains(".")) return;
          display += label;
        }
      }

      if (display.endsWith(".0")) {
        display = display.substring(0, display.length - 2);
      }
      if (display.length > 15 && display != "Error") {
        display = display.substring(0, 15);
      }
    });
  }

  // Hàm phụ trợ để tạo tiêu đề nhóm trong Drawer
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 15, bottom: 5),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  // Hàm phụ trợ tạo các dòng menu trong Drawer
  Widget _buildMenuItem(IconData icon, String title, {bool isSelected = false}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87, size: 20),
      title: Text(title, style: const TextStyle(fontSize: 14)),
      selected: isSelected,
      selectedTileColor: Colors.grey[300],
      dense: true,
      onTap: () => Navigator.pop(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // --- CẬP NHẬT DRAWER ĐẦY ĐỦ ---
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 100,
              child: DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text('Calculator', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
            _buildSectionTitle("Calculator"),
            _buildMenuItem(Icons.calculate, "Standard", isSelected: true),
            _buildMenuItem(Icons.science_outlined, "Scientific"),
            _buildMenuItem(Icons.show_chart, "Graphing"),
            _buildMenuItem(Icons.code, "Programmer"),
            _buildMenuItem(Icons.calendar_today_outlined, "Date calculation"),
            const Divider(),
            _buildSectionTitle("Converter"),
            _buildMenuItem(Icons.currency_exchange, "Currency"),
            _buildMenuItem(Icons.view_in_ar_outlined, "Volume"),
            _buildMenuItem(Icons.straighten, "Length"),
            _buildMenuItem(Icons.monitor_weight_outlined, "Weight and mass"),
            _buildMenuItem(Icons.thermostat_outlined, "Temperature"),
            _buildMenuItem(Icons.flash_on_outlined, "Energy"),
            _buildMenuItem(Icons.layers_outlined, "Area"),
            _buildMenuItem(Icons.speed, "Speed"),
            const Divider(),
            _buildMenuItem(Icons.settings_outlined, "Settings"),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Standard", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Text(
                  display,
                  style: const TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          buildKeyboard(),
        ],
      ),
    );
  }

  Widget buildKeyboard() {
    return Column(
      children: [
        buildRow(["%", "CE", "C", "⌫"]),
        buildRow(["¹/x", "x²", "√x", "÷"]),
        buildRow(["7", "8", "9", "×"]),
        buildRow(["4", "5", "6", "-"]),
        buildRow(["1", "2", "3", "+"]),
        buildRow(["+/-", "0", ".", "="]),
      ],
    );
  }

  Widget buildRow(List<String> labels) {
    return Row(
      children: labels.map((label) {
        bool isOperator = ["+", "-", "×", "÷", "="].contains(label);
        return Expanded(
          child: Container(
            margin: const EdgeInsets.all(1),
            height: 70,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isOperator ? Colors.white : Colors.white,
                foregroundColor: isOperator ? Colors.black : Colors.black,
                elevation: 0,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              onPressed: () => onButtonClick(label),
              child: Text(label, style: const TextStyle(fontSize: 18)),
            ),
          ),
        );
      }).toList(),
    );
  }
}