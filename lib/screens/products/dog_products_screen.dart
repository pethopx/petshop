import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:patili_dukkan/providers/cart_provider.dart';
import 'package:patili_dukkan/models/product.dart';
import 'package:patili_dukkan/widgets/product_card.dart';
import 'package:patili_dukkan/screens/cart/cart_screen.dart';

class DogProductsScreen extends StatelessWidget {
  const DogProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> dogProducts = [
      Product(
        id: '1',
        title: 'Yavru Köpek Maması (1kg)',
        price: 120.0,
        imageUrl: 'resimler/yavru_kopek.png',
        category: 'dog_food',
      ),
      Product(
        id: '2',
        title: 'Yetişkin Köpek Maması (1kg)',
        price: 150.0,
        imageUrl: 'resimler/yetiskin_kopek.png',
        category: 'dog_food',
      ),
      Product(
        id: '3',
        title: 'Yaş Köpek Maması (85gr)',
        price: 12.0,
        imageUrl: 'resimler/yas_kopek.png',
        category: 'dog_food',
      ),
      Product(
        id: '4',
        title: 'Kısır Köpek Maması (1kg)',
        price: 130.0,
        imageUrl: 'resimler/kisir_kopek.png',
        category: 'dog_food',
      ),
      Product(
        id: '5',
        title: 'Köpek Ödül Maması (100gr)',
        price: 25.0,
        imageUrl: 'resimler/kopek_odul.png',
        category: 'dog_food',
      ),
      Product(
        id: '6',
        title: 'Köpek Eğitim Pedi (60x90cm 10\'lu)',
        price: 80.0,
        imageUrl: 'resimler/ped.png',
        category: 'dog_accessories',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Köpek Ürünleri'),
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
        itemCount: dogProducts.length,
        itemBuilder: (ctx, index) => ProductCard(product: dogProducts[index]),
      ),
    );
  }
} 