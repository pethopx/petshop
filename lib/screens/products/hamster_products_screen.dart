import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:patili_dukkan/providers/cart_provider.dart';
import 'package:patili_dukkan/models/product.dart';

class HamsterProductsScreen extends StatelessWidget {
  const HamsterProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> hamsterProducts = [
      Product(
        id: '1',
        title: 'Hamster Yemi (500gr)',
        price: 45.0,
        imageUrl: 'https://picsum.photos/500',
        category: 'hamster_food',
      ),
      Product(
        id: '2',
        title: 'Hamster Kafesi (Orta)',
        price: 200.0,
        imageUrl: 'https://picsum.photos/501',
        category: 'hamster_cage',
      ),
      Product(
        id: '3',
        title: 'Hamster Kafesi (Büyük)',
        price: 300.0,
        imageUrl: 'https://picsum.photos/502',
        category: 'hamster_cage',
      ),
      Product(
        id: '4',
        title: 'Hamster Talaşı (2kg)',
        price: 35.0,
        imageUrl: 'https://picsum.photos/503',
        category: 'hamster_bedding',
      ),
      Product(
        id: '5',
        title: 'Hamster Talaşı (5kg)',
        price: 75.0,
        imageUrl: 'https://picsum.photos/504',
        category: 'hamster_bedding',
      ),
      Product(
        id: '6',
        title: 'Hamster Koşu Topu (Küçük)',
        price: 50.0,
        imageUrl: 'https://picsum.photos/505',
        category: 'hamster_accessories',
      ),
      Product(
        id: '7',
        title: 'Hamster Koşu Topu (Orta)',
        price: 65.0,
        imageUrl: 'https://picsum.photos/506',
        category: 'hamster_accessories',
      ),
      Product(
        id: '8',
        title: 'Hamster Koşu Topu (Büyük)',
        price: 80.0,
        imageUrl: 'https://picsum.photos/507',
        category: 'hamster_accessories',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hamster Ürünleri'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: hamsterProducts.length,
        itemBuilder: (ctx, index) => _ProductCard(product: hamsterProducts[index]),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: 120,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${product.price.toStringAsFixed(2)} TL',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .addItem(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Ürün sepete eklendi'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 