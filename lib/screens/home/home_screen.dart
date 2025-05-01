import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:patili_dukkan/providers/auth_provider.dart';
import 'package:patili_dukkan/screens/cart/cart_screen.dart';
import 'package:patili_dukkan/screens/products/cat_products_screen.dart';
import 'package:patili_dukkan/screens/products/dog_products_screen.dart';
import 'package:patili_dukkan/screens/products/fish_products_screen.dart';
import 'package:patili_dukkan/screens/products/bird_products_screen.dart';
import 'package:patili_dukkan/screens/products/hamster_products_screen.dart';
import 'package:patili_dukkan/screens/products/rabbit_products_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
    });
  }

  bool _shouldShowCategory(String categoryName, List<String> searchTerms) {
    if (_searchQuery.isEmpty) return true;
    
    final categoryLower = categoryName.toLowerCase();
    return searchTerms.any((term) => categoryLower.contains(term));
  }

  @override
  Widget build(BuildContext context) {
    final searchTerms = _searchQuery.split(' ').where((term) => term.isNotEmpty).toList();

    return Scaffold(
      appBar: AppBar( 
        title: const Text('Evcil Market'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Ürün veya kategori ara...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _onSearchChanged('');
                        },
                      )
                    : null,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(8),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.5,
              children: [
                if (_shouldShowCategory('Kedi Ürünleri', searchTerms))
                  _CategoryCard(
                    title: 'Kedi Ürünleri',
                    icon: Icons.pets,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CatProductsScreen(),
                        ),
                      );
                    },
                  ),
                if (_shouldShowCategory('Köpek Ürünleri', searchTerms))
                  _CategoryCard(
                    title: 'Köpek Ürünleri',
                    icon: Icons.pets,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DogProductsScreen(),
                        ),
                      );
                    },
                  ),
                if (_shouldShowCategory('Balık Ürünleri', searchTerms))
                  _CategoryCard(
                    title: 'Balık Ürünleri',
                    icon: Icons.pets,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FishProductsScreen(),
                        ),
                      );
                    },
                  ),
                if (_shouldShowCategory('Kuş Ürünleri', searchTerms))
                  _CategoryCard(
                    title: 'Kuş Ürünleri',
                    icon: Icons.pets,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BirdProductsScreen(),
                        ),
                      );
                    },
                  ),
                if (_shouldShowCategory('Hamster Ürünleri', searchTerms))
                  _CategoryCard(
                    title: 'Hamster Ürünleri',
                    icon: Icons.pets,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HamsterProductsScreen(),
                        ),
                      );
                    },
                  ),
                if (_shouldShowCategory('Tavşan Ürünleri', searchTerms))
                  _CategoryCard(
                    title: 'Tavşan Ürünleri',
                    icon: Icons.pets,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RabbitProductsScreen(),
                        ),
                      );
                    },
                  ),
              ],
            ),
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
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 