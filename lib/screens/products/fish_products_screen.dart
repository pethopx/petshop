import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:patili_dukkan/providers/cart_provider.dart';
import 'package:patili_dukkan/models/product.dart';

class FishProductsScreen extends StatelessWidget {
  const FishProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> fishProducts = [
      Product(
        id: '1',
        title: 'Tropikal Balık Yemi (100gr)',
        price: 45.0,
        imageUrl: 'https://picsum.photos/300',
        category: 'fish_food',
      ),
      Product(
        id: '2',
        title: 'Japon Balığı Yemi (100gr)',
        price: 35.0,
        imageUrl: 'https://picsum.photos/301',
        category: 'fish_food',
      ),
      Product(
        id: '3',
        title: 'Orta Boy Akvaryum (30L)',
        price: 450.0,
        imageUrl: 'https://picsum.photos/302',
        category: 'aquarium',
      ),
      Product(
        id: '4',
        title: 'Büyük Boy Akvaryum (60L)',
        price: 750.0,
        imageUrl: 'https://picsum.photos/303',
        category: 'aquarium',
      ),
      Product(
        id: '5',
        title: 'Doğal Akvaryum Taşı (1kg)',
        price: 25.0,
        imageUrl: 'https://picsum.photos/304',
        category: 'aquarium_stone',
      ),
      Product(
        id: '6',
        title: 'Renkli Akvaryum Taşı (1kg)',
        price: 30.0,
        imageUrl: 'https://picsum.photos/305',
        category: 'aquarium_stone',
      ),
      Product(
        id: '7',
        title: 'Akvaryum Süsü (Mağara)',
        price: 85.0,
        imageUrl: 'https://picsum.photos/306',
        category: 'aquarium_decoration',
      ),
      Product(
        id: '8',
        title: 'Akvaryum Süsü (Batık Gemi)',
        price: 120.0,
        imageUrl: 'https://picsum.photos/307',
        category: 'aquarium_decoration',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Balık Ürünleri'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: fishProducts.length,
        itemBuilder: (ctx, index) => _ProductCard(product: fishProducts[index]),
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