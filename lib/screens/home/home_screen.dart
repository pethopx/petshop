import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:patili_dukkan/providers/auth_provider.dart';
import 'package:patili_dukkan/providers/cart_provider.dart';
import 'package:patili_dukkan/screens/products/bird_products_screen.dart';
import 'package:patili_dukkan/screens/products/cat_products_screen.dart';
import 'package:patili_dukkan/screens/products/dog_products_screen.dart';
import 'package:patili_dukkan/screens/products/fish_products_screen.dart';
import 'package:patili_dukkan/screens/products/hamster_products_screen.dart';
import 'package:patili_dukkan/screens/products/rabbit_products_screen.dart';
import 'package:patili_dukkan/screens/cart/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PattMall'),
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
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
          ),
        ],
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _CategoryCard(
            title: 'Kedi Ürünleri',
            icon: Icons.pets,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CatProductsScreen()),
              );
            },
          ),
          _CategoryCard(
            title: 'Köpek Ürünleri',
            icon: Icons.pets,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DogProductsScreen()),
              );
            },
          ),
          _CategoryCard(
            title: 'Balık Ürünleri',
            icon: Icons.water,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FishProductsScreen()),
              );
            },
          ),
          _CategoryCard(
            title: 'Kuş Ürünleri',
            icon: Icons.flutter_dash,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BirdProductsScreen()),
              );
            },
          ),
          _CategoryCard(
            title: 'Tavşan Ürünleri',
            icon: Icons.cruelty_free,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RabbitProductsScreen()),
              );
            },
          ),
          _CategoryCard(
            title: 'Hamster Ürünleri',
            icon: Icons.pets,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HamsterProductsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 