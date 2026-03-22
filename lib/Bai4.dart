import 'package:flutter/material.dart';

// 1. Model dữ liệu dùng chung
class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  Product(this.name, this.description, this.price, this.imageUrl);
}

// Giỏ hàng lưu trữ toàn cục (Global)
List<Product> globalCart = [];

class Bai4 extends StatelessWidget {
  const Bai4({super.key});

  @override
  Widget build(BuildContext context) {
    // Chạy màn hình đầu tiên là WelcomeScreen
    return const WelcomeScreen();
  }
}

// 2. Màn hình Chào mừng
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo giả lập (Bạn có thể thay bằng Image.asset nếu có file)
            const Icon(Icons.phone_iphone, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            const Text("Cửa hàng điện thoại", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text("140 Lê Trọng Tấn, Tân Phú, TP.HCM", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ShopScreen())),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: Colors.grey[300]!)),
                child: const Icon(Icons.arrow_forward, size: 30, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. Màn hình Danh sách sản phẩm
class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final List<Product> products = [
    Product("Điện thoại 01", "Điện thoại mới của hãng Samsung với công nghệ hiện đại", 1200.0, "https://via.placeholder.com/150"),
    Product("Điện thoại 02", "Thiết kế sang trọng, camera siêu nét", 200.0, "https://via.placeholder.com/150"),
    Product("Điện thoại 03", "Hiệu năng mạnh mẽ cho game thủ", 800.0, "https://via.placeholder.com/150"),
  ];

  void _confirmAdd(Product p) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Xác nhận"),
        content: const Text("Bạn vừa thêm sản phẩm vào Giỏ hàng"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Không")),
          TextButton(onPressed: () {
            setState(() => globalCart.add(p));
            Navigator.pop(ctx);
          }, child: const Text("Đồng ý")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Cửa hàng điện thoại"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen())).then((_) => setState(() {})),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              currentAccountPicture: CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.person, color: Colors.blue)),
              accountName: Text("Vũ Văn Vinh"),
              accountEmail: Text("vinhvv@huit.edu.vn"),
            ),
            ListTile(leading: const Icon(Icons.store, color: Colors.blue), title: const Text("Cửa hàng"), onTap: () => Navigator.pop(context)),
            ListTile(
              leading: const Icon(Icons.shopping_cart, color: Colors.blue),
              title: Text("Giỏ hàng (${globalCart.length})"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen())).then((_) => setState(() {}));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.blue),
              title: const Text("Thoát"),
              onTap: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()), (route) => false),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.all(15), child: Text("Chọn sản phẩm bạn muốn sử dụng", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          SizedBox(
            height: 380,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: products.length,
              itemBuilder: (ctx, i) => _buildCard(products[i]),
            ),
          ),
          const Spacer(),
          const Center(child: Padding(padding: EdgeInsets.only(bottom: 20), child: Text("Sản phẩm được lựa chọn nhiều nhất", style: TextStyle(color: Colors.grey)))),
        ],
      ),
    );
  }

  Widget _buildCard(Product p) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 15, bottom: 20),
      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.black12)),
      child: Column(
        children: [
          ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(20)), child: Image.network(p.imageUrl, height: 180, width: double.infinity, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 5),
                Text(p.description, style: const TextStyle(fontSize: 12, color: Colors.black54), maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${p.price}", style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: () => _confirmAdd(p),
                      child: Container(decoration: BoxDecoration(color: Colors.tealAccent[700], borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.add, color: Colors.white)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// 4. Màn hình Giỏ hàng
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Xác nhận"),
        content: const Text("Bạn muốn loại bỏ sản phẩm này ra khỏi giỏ hàng"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Không")),
          TextButton(onPressed: () {
            setState(() => globalCart.removeAt(index));
            Navigator.pop(ctx);
          }, child: const Text("Đồng ý")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange, title: const Text("Giỏ hàng của bạn")),
      body: globalCart.isEmpty
          ? const Center(child: Text("Bạn chưa bỏ sản phẩm nào vào giỏ hàng!!!", style: TextStyle(color: Colors.grey)))
          : Column(
        children: [
          const Padding(padding: EdgeInsets.all(15), child: Text("Giỏ hàng của bạn", style: TextStyle(color: Colors.grey))),
          Expanded(
            child: ListView.builder(
              itemCount: globalCart.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(globalCart[i].name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("${globalCart[i].price}"),
                trailing: IconButton(icon: const Icon(Icons.delete, color: Colors.black), onPressed: () => _confirmDelete(i)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.tealAccent[100], foregroundColor: Colors.teal[800], shape: const StadiumBorder()),
              onPressed: () => showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Thanh toán"),
                  content: const Text("Bạn đã thanh toán xong giỏ hàng"),
                  actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("OK"))],
                ),
              ),
              child: const Text("Thanh toán"),
            ),
          ),
        ],
      ),
    );
  }
}