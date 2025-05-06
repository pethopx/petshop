import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:patili_dukkan/providers/cart_provider.dart';
import 'package:patili_dukkan/models/product.dart';
import 'package:patili_dukkan/widgets/product_card.dart';
import 'package:patili_dukkan/screens/cart/cart_screen.dart';

class BirdProductsScreen extends StatelessWidget {
  const BirdProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> birdProducts = [
      Product(
        id: '1',
        title: 'Muhabbet Kuşu Yemi (500gr)',
        price: 40.0,
        imageUrl: 'resimler/muhabbet_kusu.png',
        category: 'bird_food',
      ),
      Product(
        id: '2',
        title: 'Kanarya Kuşu Yemi (500gr)',
        price: 45.0,
        imageUrl: 'resimler/kanarya_kusu.png',
        category: 'bird_food',
      ),
      Product(
        id: '3',
        title: 'Küçük Kuş Kafesi',
        price: 150.0,
        imageUrl: 'resimler/k_kafes.png',
        category: 'bird_cage',
      ),
      Product(
        id: '4',
        title: 'Büyük Kuş Kafesi',
        price: 250.0,
        imageUrl: 'resimler/b_kafes.png',
        category: 'bird_cage',
      ),
      Product(
        id: '5',
        title: 'Kuş Gaga Taşı',
        price: 15.0,
        imageUrl: 'resimler/gaga_tasi.png',
        category: 'bird_accessories',
      ),
      Product(
        id: '6',
        title: 'Kuş Vitamin Takviyesi',
        price: 35.0,
        imageUrl: 'resimler/vitamin.png',
        category: 'bird_accessories',
      ),
      Product(
        id: '7',
        title: 'Kuş Yemliği',
        price: 25.0,
        imageUrl: 'resimler/yemlik.png',
        category: 'bird_accessories',
      ),
      Product(
        id: '8',
        title: 'Kuş Suluğu',
        price: 20.0,
        imageUrl: 'resimler/suluk.png',
        category: 'bird_accessories',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuş Ürünleri'),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  );
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Consumer<CartProvider>(
                  builder: (ctx, cart, _) => cart.itemCount > 0
                      ? Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '${cart.itemCount}',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : const SizedBox(),
                ),
              ),
            ],
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: birdProducts.length,
        itemBuilder: (ctx, index) => ProductCard(product: birdProducts[index]),
      ),
    );
  }
}