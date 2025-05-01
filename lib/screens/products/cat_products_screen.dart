import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:patili_dukkan/providers/cart_provider.dart';
import 'package:patili_dukkan/models/product.dart';

class CatProductsScreen extends StatelessWidget {
  const CatProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> catProducts = [
      Product(
        id: '1',
        title: 'Yavru Kedi Maması (1kg)',
        price: 120.0,
        imageUrl: 'https://picsum.photos/200',
        category: 'cat_food',
      ),
      Product(
        id: '2',
        title: 'Yetişkin Kedi Maması (1kg)',
        price: 150.0,
        imageUrl: 'https://picsum.photos/201',
        category: 'cat_food',
      ),
      Product(
        id: '3',
        title: 'İnce Taneli Kedi Kumu (5kg)',
        price: 80.0,
        imageUrl: 'https://picsum.photos/202',
        category: 'cat_litter',
      ),
      Product(
        id: '4',
        title: 'Kalın Taneli Kedi Kumu (5kg)',
        price: 100.0,
        imageUrl: 'https://picsum.photos/203',
        category: 'cat_litter',
      ),
      Product(
        id: '5',
        title: 'Yaş Kedi Maması (85gr)',
        price: 12.0,
        imageUrl: 'https://picsum.photos/204',
        category: 'cat_food',
      ),
      Product(
        id: '6',
        title: 'Kısır Kedi Maması (1kg)',
        price: 130.0,
        imageUrl: 'https://picsum.photos/205',
        category: 'cat_food',
      ),
      Product(
        id: '7',
        title: 'Kedi Tırmalama Tahtası',
        price: 150.0,
        imageUrl: 'https://picsum.photos/206',
        category: 'cat_accessories',
      ),
      Product(
        id: '8',
        title: 'Kedi Taşıma Çantası',
        price: 200.0,
        imageUrl: 'https://picsum.photos/207',
        category: 'cat_accessories',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kedi Ürünleri'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: catProducts.length,
        itemBuilder: (ctx, index) => _ProductCard(product: catProducts[index]),
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