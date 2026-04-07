import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/sinhvien_provider.dart';
import 'v_adSinhVien.dart';

class SinhVienListScreen extends StatelessWidget {
  const SinhVienListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách sinh viên"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => const AddSinhVien())),
          ),
        ],
      ),
      body: Consumer<SinhVienProvider>(
        builder: (context, provider, child) {
          if (provider.sinhViens.isEmpty) {
            return const Center(child: Text("Chưa có sinh viên nào"));
          }
          return ListView.builder(
            itemCount: provider.sinhViens.length,
            itemBuilder: (context, index) {
              final sv = provider.sinhViens[index];
              return Card(
                child: ListTile(
                  title: Text(sv.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(sv.email),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => provider.deleteSinhVien(sv.id!),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}