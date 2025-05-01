import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:patili_dukkan/providers/cart_provider.dart';
import 'package:patili_dukkan/models/product.dart';

class RabbitProductsScreen extends StatelessWidget {
  const RabbitProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> rabbitProducts = [
      Product(
        id: '1',
        title: 'Tavşan Yemi (1kg)',
        price: 55.0,
        imageUrl: 'https://picsum.photos/600',
        category: 'rabbit_food',
      ),
      Product(
        id: '2',
        title: 'Tavşan Yemi (2kg)',
        price: 95.0,
        imageUrl: 'https://picsum.photos/601',
        category: 'rabbit_food',
      ),
      Product(
        id: '3',
        title: 'Tavşan Kafesi (Orta)',
        price: 350.0,
        imageUrl: 'https://picsum.photos/602',
        category: 'rabbit_cage',
      ),
      Product(
        id: '4',
        title: 'Tavşan Kafesi (Büyük)',
        price: 450.0,
        imageUrl: 'https://picsum.photos/603',
        category: 'rabbit_cage',
      ),
      Product(
        id: '5',
        title: 'Tavşan Talaşı (2kg)',
        price: 40.0,
        imageUrl: 'https://picsum.photos/604',
        category: 'rabbit_bedding',
      ),
      Product(
        id: '6',
        title: 'Tavşan Talaşı (5kg)',
        price: 85.0,
        imageUrl: 'https://picsum.photos/605',
        category: 'rabbit_bedding',
      ),
      Product(
        id: '7',
        title: 'Tavşan Suluk (Orta)',
        price: 45.0,
        imageUrl: 'https://picsum.photos/606',
        category: 'rabbit_accessories',
      ),
      Product(
        id: '8',
        title: 'Tavşan Suluk (Büyük)',
        price: 65.0,
        imageUrl: 'https://picsum.photos/607',
        category: 'rabbit_accessories',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tavşan Ürünleri'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: rabbitProducts.length,
        itemBuilder: (ctx, index) => _ProductCard(product: rabbitProducts[index]),
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