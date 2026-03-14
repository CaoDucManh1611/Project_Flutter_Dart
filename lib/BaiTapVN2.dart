import 'package:flutter/material.dart';

class BaiTapVN2 extends StatelessWidget {
  const BaiTapVN2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // 1. App Bar: Hello, Mitch Koko
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Hello,', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                      Text('Mitch Koko', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.deepPurple[100], borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.person, color: Colors.deepPurple),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // 2. Banner Card: How do you feel?
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.pink[100], borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    // Hình minh họa (Placeholder)
                    Container(height: 100, width: 100, color: Colors.deepPurple[200]),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('How do you feel?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 8),
                          const Text('Fill out your medical card right now'),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(color: Colors.deepPurple[400], borderRadius: BorderRadius.circular(12)),
                            child: const Center(child: Text('Get Started', style: TextStyle(color: Colors.white))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // 3. Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(color: Colors.deepPurple[100], borderRadius: BorderRadius.circular(12)),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    hintText: 'How can we help you?',
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // 4. Horizontal Categories
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryItem(Icons.medical_services, 'Dentist'),
                    _buildCategoryItem(Icons.person, 'Surgeon'),
                    _buildCategoryItem(Icons.local_pharmacy, 'Pharmacy'),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // 5. Doctor List Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Doctor list', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('See all', style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 20),

              // 6. Doctor Cards
              Row(
                children: [
                  _buildDoctorCard('Dr. Mitch Koko', 'Psychologist 7 y.e.', '4.4'),
                  const SizedBox(width: 15),
                  _buildDoctorCard('Dr. Steve Jobs', 'Surgeon 7 y.e.', '5.0'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget con cho Category
  Widget _buildCategoryItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: Colors.deepPurple[100], borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepPurple),
          const SizedBox(width: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // Widget con cho Doctor Card
  Widget _buildDoctorCard(String name, String job, String rating) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: Colors.deepPurple[100], borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            const CircleAvatar(radius: 40, backgroundColor: Colors.white), // Chỗ này để ảnh bác sĩ
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.yellow, size: 16),
                Text(rating, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(job, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}