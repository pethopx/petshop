import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:patili_dukkan/providers/cart_provider.dart';
import 'package:patili_dukkan/models/product.dart';
import 'package:patili_dukkan/widgets/product_card.dart';
import 'package:patili_dukkan/screens/cart/cart_screen.dart';

class RabbitProductsScreen extends StatelessWidget {
  const RabbitProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> rabbitProducts = [
      Product(
        id: '1',
        title: 'Tavşan Yemi (Az)',
        price: 50.0,
        imageUrl: 'resimler/tavsan_yem_az.png',
        category: 'rabbit_food',
      ),
      Product(
        id: '2',
        title: 'Tavşan Yemi (Çok)',
        price: 90.0,
        imageUrl: 'resimler/tavsan_yem-cok.png',
        category: 'rabbit_food',
      ),
      Product(
        id: '3',
        title: 'Tavşan Talaşı (Az)',
        price: 40.0,
        imageUrl: 'resimler/tavsan_talas_az.png',
        category: 'rabbit_bedding',
      ),
      Product(
        id: '4',
        title: 'Tavşan Talaşı (Çok)',
        price: 75.0,
        imageUrl: 'resimler/tavsan_talas_cok.png',
        category: 'rabbit_bedding',
      ),
      Product(
        id: '5',
        title: 'Tavşan Kafesi (Küçük)',
        price: 200.0,
        imageUrl: 'resimler/tavsan_kafes_kucuk.png',
        category: 'rabbit_cage',
      ),
      Product(
        id: '6',
        title: 'Tavşan Kafesi (Büyük)',
        price: 350.0,
        imageUrl: 'resimler/tavsan_kafes_buyuk.png',
        category: 'rabbit_cage',
      ),
      Product(
        id: '7',
        title: 'Tavşan Suluğu',
        price: 30.0,
        imageUrl: 'resimler/tavsan_suluk.png',
        category: 'rabbit_accessories',
      ),
      Product(
        id: '8',
        title: 'Tavşan Büyük Suluğu',
        price: 45.0,
        imageUrl: 'resimler/tavsan_buyuk_suluk.png',
        category: 'rabbit_accessories',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tavşan Ürünleri'),
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
        itemCount: rabbitProducts.length,
        itemBuilder: (ctx, index) => ProductCard(product: rabbitProducts[index]),
      ),
    );
  }
} 