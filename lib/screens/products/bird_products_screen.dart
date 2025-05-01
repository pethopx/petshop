import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:patili_dukkan/providers/cart_provider.dart';
import 'package:patili_dukkan/models/product.dart';

class BirdProductsScreen extends StatelessWidget {
  const BirdProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> birdProducts = [
      Product(
        id: '1',
        title: 'Muhabbet Kuşu Yemi (500gr)',
        price: 35.0,
        imageUrl: 'https://picsum.photos/400',
        category: 'bird_food',
      ),
      Product(
        id: '2',
        title: 'Kanarya Yemi (500gr)',
        price: 40.0,
        imageUrl: 'https://picsum.photos/401',
        category: 'bird_food',
      ),
      Product(
        id: '3',
        title: 'Orta Boy Kuş Kafesi',
        price: 250.0,
        imageUrl: 'https://picsum.photos/402',
        category: 'bird_cage',
      ),
      Product(
        id: '4',
        title: 'Büyük Boy Kuş Kafesi',
        price: 350.0,
        imageUrl: 'https://picsum.photos/403',
        category: 'bird_cage',
      ),
      Product(
        id: '5',
        title: 'Kuş Vitamini (100ml)',
        price: 45.0,
        imageUrl: 'https://picsum.photos/404',
        category: 'bird_vitamin',
      ),
      Product(
        id: '6',
        title: 'Gaga Taşı',
        price: 15.0,
        imageUrl: 'https://picsum.photos/405',
        category: 'bird_accessories',
      ),
      Product(
        id: '7',
        title: 'Otomatik Yemlik',
        price: 25.0,
        imageUrl: 'https://picsum.photos/406',
        category: 'bird_accessories',
      ),
      Product(
        id: '8',
        title: 'Otomatik Suluk',
        price: 30.0,
        imageUrl: 'https://picsum.photos/407',
        category: 'bird_accessories',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuş Ürünleri'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: birdProducts.length,
        itemBuilder: (ctx, index) => _ProductCard(product: birdProducts[index]),
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