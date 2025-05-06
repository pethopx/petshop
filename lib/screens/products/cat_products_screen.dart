import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:patili_dukkan/providers/cart_provider.dart';
import 'package:patili_dukkan/models/product.dart';
import 'package:patili_dukkan/widgets/product_card.dart';
import 'package:patili_dukkan/screens/cart/cart_screen.dart';

class CatProductsScreen extends StatelessWidget {
  const CatProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> catProducts = [
      Product(
        id: '1',
        title: 'Yavru Kedi Maması (1kg)',
        price: 120.0,
        imageUrl:  'resimler/yavru_kedi.png',
        category: 'cat_food',
      ),
      Product(
        id: '2',
        title: 'Yetişkin Kedi Maması (1kg)',
        price: 150.0,
        imageUrl: 'resimler/yetiskin_kedi.png',
        category: 'cat_food',
      ),
      Product(
        id: '3',
        title: 'İnce Taneli Kedi Kumu (5kg)',
        price: 80.0,
        imageUrl: 'resimler/ince_taneli_kum.png',
        category: 'cat_litter',
      ),
      Product(
        id: '4',
        title: 'Kalın Taneli Kedi Kumu (5kg)',
        price: 100.0,
        imageUrl: 'resimler/kalin_taneli_kum.png',
        category: 'cat_litter',
      ),
      Product(
        id: '5',
        title: 'Yaş Kedi Maması (85gr)',
        price: 12.0,
        imageUrl: 'resimler/yas_kedi.png',
        category: 'cat_food',
      ),
      Product(
        id: '6',
        title: 'Kısır Kedi Maması (1kg)',
        price: 130.0,
        imageUrl: 'resimler/kisir_kedi.png',
        category: 'cat_food',
      ),
      Product(
        id: '7',
        title: 'Kedi Tırmalama Tahtası',
        price: 150.0,
        imageUrl: 'resimler/tirmalama_tahtasi.png',
        category: 'cat_accessories',
      ),
      Product(
        id: '8',
        title: 'Kedi Taşıma Çantası',
        price: 200.0,
        imageUrl: 'resimler/tasima_kutu.png',
        category: 'cat_accessories',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kedi Ürünleri'),
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
        itemCount: catProducts.length,
        itemBuilder: (ctx, index) => ProductCard(product: catProducts[index]),
      ),
    );
  }
}