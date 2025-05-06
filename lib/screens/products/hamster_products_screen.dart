import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:patili_dukkan/providers/cart_provider.dart';
import 'package:patili_dukkan/models/product.dart';
import 'package:patili_dukkan/widgets/product_card.dart';
import 'package:patili_dukkan/screens/cart/cart_screen.dart';

class HamsterProductsScreen extends StatelessWidget {
  const HamsterProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> hamsterProducts = [
      Product(
        id: '1',
        title: 'Hamster Yemi (500gr)',
        price: 40.0,
        imageUrl: 'resimler/hamster_yem.png',
        category: 'hamster_food',
      ),
      Product(
        id: '2',
        title: 'Hamster Talaşı (Az Tüylü)',
        price: 35.0,
        imageUrl: 'resimler/talas_az.png',
        category: 'hamster_bedding',
      ),
      Product(
        id: '3',
        title: 'Hamster Talaşı (Çok Tüylü)',
        price: 45.0,
        imageUrl: 'resimler/talas_cok.png',
        category: 'hamster_bedding',
      ),
      Product(
        id: '4',
        title: 'Hamster Kafesi (Orta Boy)',
        price: 180.0,
        imageUrl: 'resimler/hamster_orta_kafes.png',
        category: 'hamster_cage',
      ),
      Product(
        id: '5',
        title: 'Hamster Kafesi (Büyük Boy)',
        price: 250.0,
        imageUrl: 'resimler/hamster_buyuk_kafes.png',
        category: 'hamster_cage',
      ),
      Product(
        id: '6',
        title: 'Hamster Koşu Topu (Küçük)',
        price: 40.0,
        imageUrl: 'resimler/hamster_kucuk_top.png',
        category: 'hamster_toys',
      ),
      Product(
        id: '7',
        title: 'Hamster Koşu Topu (Orta)',
        price: 50.0,
        imageUrl: 'resimler/hamster_orta_top.png',
        category: 'hamster_toys',
      ),
      Product(
        id: '8',
        title: 'Hamster Koşu Topu (Büyük)',
        price: 60.0,
        imageUrl: 'resimler/hamster_buyuk_top.png',
        category: 'hamster_toys',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hamster Ürünleri'),
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
        itemCount: hamsterProducts.length,
        itemBuilder: (ctx, index) => ProductCard(product: hamsterProducts[index]),
      ),
    );
  }
} 