import 'package:flutter/material.dart';
import '../config/constants.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _results = [];

  void _onSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _results = [];
      } else {
        _results = Product.sampleProducts
            .where((p) => p.name.contains(query) || p.category.contains(query))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'ابحث عن المنتجات...',
            border: InputBorder.none,
            filled: false,
          ),
          style: Theme.of(context).textTheme.bodyLarge,
          onChanged: _onSearch,
        ),
        actions: [
          if (_searchController.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                _onSearch('');
              },
            ),
        ],
      ),
      body: _results.isEmpty && _searchController.text.isNotEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_off,
                      size: 64, color: AppColors.mediumBrown.withValues(alpha: 0.5)),
                  const SizedBox(height: 16),
                  Text(
                    'لا توجد نتائج',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.mediumBrown,
                        ),
                  ),
                ],
              ),
            )
          : _results.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search,
                          size: 64,
                          color: AppColors.mediumBrown.withValues(alpha: 0.3)),
                      const SizedBox(height: 16),
                      Text(
                        'ابحث عن كعكتك المفضلة',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.mediumBrown,
                            ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: _results.length,
                    itemBuilder: (context, index) =>
                        ProductCard(product: _results[index]),
                  ),
                ),
    );
  }
}
