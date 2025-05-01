import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:patili_dukkan/providers/cart_provider.dart';
import 'package:patili_dukkan/models/product.dart';

class DogProductsScreen extends StatelessWidget {
  const DogProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> dogProducts = [
      Product(
        id: '7',
        title: 'Yavru Köpek Maması 1',
        price: 150.0,
        imageUrl: 'https://picsum.photos/204',
        category: 'dog_food',
      ),
      Product(
        id: '8',
        title: 'Yetişkin Köpek Maması 2',
        price: 180.0,
        imageUrl: 'https://picsum.photos/205',
        category: 'dog_food',
      ),
      Product(
        id: '9',
        title: 'Yaş Köpek Maması 3',
        price: 200.0,
        imageUrl: 'https://picsum.photos/206',
        category: 'dog_food',
      ),
      Product(
        id: '10',
        title: 'Kısır Köpek Maması 4',
        price: 220.0,
        imageUrl: 'https://picsum.photos/207',
        category: 'dog_food',
      ),
      Product(
        id: '11',
        title: 'Köpek Ödül Maması 5',
        price: 240.0,
        imageUrl: 'https://picsum.photos/208',
        category: 'dog_food',
      ),
      Product(
        id: '12',
        title:' Köpek Eğitim Tuvalet Pedi 6',
        price: 260.0,
        imageUrl: 'https://picsum.photos/209',
        category: 'dog_food',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Köpek Ürünleri'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: dogProducts.length,
        itemBuilder: (ctx, index) => _ProductCard(product: dogProducts[index]),
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