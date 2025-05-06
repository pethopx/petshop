import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:patili_dukkan/providers/cart_provider.dart';
import 'package:patili_dukkan/models/product.dart';
import 'package:patili_dukkan/widgets/product_card.dart';
import 'package:patili_dukkan/screens/cart/cart_screen.dart';

class FishProductsScreen extends StatelessWidget {
  const FishProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> fishProducts = [
      Product(
        id: '1',
        title: 'Japon Balığı Yemi (100gr)',
        price: 35.0,
        imageUrl: 'resimler/japon_yem.png',
        category: 'fish_food',
      ),
      Product(
        id: '2',
        title: 'Tropical Balık Yemi (100gr)',
        price: 40.0,
        imageUrl: 'resimler/tropical_yem.png',
        category: 'fish_food',
      ),
      Product(
        id: '3',
        title: 'Orta Boy Akvaryum (50L)',
        price: 500.0,
        imageUrl: 'resimler/orta_akvaryum.png',
        category: 'fish_tank',
      ),
      Product(
        id: '4',
        title: 'Büyük Boy Akvaryum (100L)',
        price: 900.0,
        imageUrl: 'resimler/buyuk_akvaryum.png',
        category: 'fish_tank',
      ),
      Product(
        id: '5',
        title: 'Renkli Akvaryum Taşları (500gr)',
        price: 50.0,
        imageUrl: 'resimler/renkli_tas.png',
        category: 'fish_accessories',
      ),
      Product(
        id: '6',
        title: 'Doğal Akvaryum Taşları (500gr)',
        price: 45.0,
        imageUrl: 'resimler/dogal_tas.png',
        category: 'fish_accessories',
      ),
      Product(
        id: '7',
        title: 'Akvaryum Süs Mağara',
        price: 80.0,
        imageUrl: 'resimler/sus_magara.png',
        category: 'fish_accessories',
      ),
      Product(
        id: '8',
        title: 'Akvaryum Süs Gemi',
        price: 120.0,
        imageUrl: 'resimler/sus_gemi.png',
        category: 'fish_accessories',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Balık Ürünleri'),
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
        itemCount: fishProducts.length,
        itemBuilder: (ctx, index) => ProductCard(product: fishProducts[index]),
      ),
    );
  }
} 