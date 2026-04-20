import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';

void main() => runApp(MaterialApp(home: UserListScreen()));

// --- Màn hình 1: Danh sách người dùng ---
class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<Map<String, dynamic>> _users = [];

  void _refreshUsers() async {
    final db = await DBHelper.initDB();
    final data = await db.query('users');
    setState(() => _users = data);
  }

  @override
  void initState() {
    super.initState();
    _refreshUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Management")),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundImage: _users[index]['imagePath'] != null
                ? FileImage(File(_users[index]['imagePath']))
                : null,
          ),
          title: Text(_users[index]['name']),
          subtitle: Text(_users[index]['email']),
          onTap: () async {
            await Navigator.push(context, MaterialPageRoute(
              builder: (context) => EditProfileScreen(user: _users[index]),
            ));
            _refreshUsers();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(
            builder: (context) => EditProfileScreen(),
          ));
          _refreshUsers();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// --- Màn hình 2: Chỉnh sửa / Thêm Profile (Giống ảnh mẫu bạn gửi) ---
class EditProfileScreen extends StatefulWidget {
  final Map<String, dynamic>? user;
  EditProfileScreen({this.user});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  File? _image;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _nameController.text = widget.user!['name'];
      _emailController.text = widget.user!['email'];
      if (widget.user!['imagePath'] != null) {
        _image = File(widget.user!['imagePath']);
      }
    }
  }

  Future _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) setState(() => _image = File(pickedFile.path));
  }

  Future _saveUser() async {
    final db = await DBHelper.initDB();
    final userData = {
      'name': _nameController.text,
      'email': _emailController.text,
      'password': _passController.text,
      'imagePath': _image?.path,
    };

    if (widget.user == null) {
      await db.insert('users', userData);
    } else {
      await db.update('users', userData, where: "id = ?", whereArgs: [widget.user!['id']]);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile"), leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context))),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Stack(
                children: [
                  CircleAvatar(radius: 60, backgroundImage: _image != null ? FileImage(_image!) : null),
                  Positioned(bottom: 0, right: 0, child: CircleAvatar(radius: 15, child: Icon(Icons.camera_alt, size: 15))),
                ],
              ),
            ),
            SizedBox(height: 30),
            TextField(controller: _nameController, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: _emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: _passController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 40),
            ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50), backgroundColor: Color(0xFF2D033B)),
                onPressed: _saveUser,
                child: Text("Save changes", style: TextStyle(color: Colors.white))
            ),
          ],
        ),
      ),
    );
  }
}