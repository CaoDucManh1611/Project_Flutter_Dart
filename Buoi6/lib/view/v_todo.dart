import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/todo_provider.dart';
import '../model/todo.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo")),
      body: Consumer<TodoProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.list.length,
            itemBuilder: (context, i) {
              final item = provider.list[i];
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  border: Border.all(color: Colors.blue.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(item.title, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                  subtitle: Row(
                    children: [
                      Checkbox(
                        value: item.isDone == 1,
                        onChanged: (v) => provider.toggleStatus(item),
                      ),
                      Text(item.isDone == 1 ? "Hoàn thành" : "Chưa hoàn thành"),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => provider.remove(item.id!),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    final tTitle = TextEditingController();
    final tContent = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Add New Todo"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: tTitle, decoration: const InputDecoration(labelText: "Title")),
            TextField(controller: tContent, decoration: const InputDecoration(labelText: "Content")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              context.read<TodoProvider>().add(Todo(title: tTitle.text, content: tContent.text));
              Navigator.pop(ctx);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}