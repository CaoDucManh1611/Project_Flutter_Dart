import 'package:flutter/material.dart';
import '../model/Taikhoan.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  // Danh sách giả lập cơ sở dữ liệu tài khoản
  static List<Taikhoan> _accounts = [
    Taikhoan(email: "binbin@gmail.com", password: "123"),
  ];

  void _signIn() {
    String email = _emailController.text.trim();
    String password = _passController.text.trim();

    // Kiểm tra thông tin trùng khớp
    bool isSuccess = _accounts.any((user) => user.email == email && user.password == password);

    if (isSuccess) {
      _showSnackBar("Đăng nhập thành công!", Colors.green);
    } else {
      _showSnackBar("Email hoặc mật khẩu không chính xác!", Colors.red);
    }
  }

  void _register() {
    String email = _emailController.text.trim();
    String password = _passController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar("Vui lòng nhập đầy đủ thông tin để đăng ký", Colors.orange);
      return;
    }

    // Kiểm tra xem email đã tồn tại chưa
    if (_accounts.any((user) => user.email == email)) {
      _showSnackBar("Email này đã được đăng ký!", Colors.red);
    } else {
      setState(() {
        _accounts.add(Taikhoan(email: email, password: password));
      });
      _showSnackBar("Đăng ký tài khoản thành công!", Colors.blue);
    }
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Đăng Nhập / Đăng Ký")),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Để khung co giãn theo nội dung
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Value",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              TextField(
                controller: _passController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Value",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _signIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2D2D2D),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    child: const Text("Sign in"),
                  ),
                  ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2D2D2D),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    child: const Text("Register"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}