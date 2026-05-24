import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/constants.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../providers/favorites_provider.dart';
import '../services/whatsapp_service.dart';
import '../widgets/responsive_layout.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobileLayout(),
      desktop: _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        actions: [
          Consumer<FavoritesProvider>(
            builder: (context, fav, _) => IconButton(
              icon: Icon(
                fav.isFavorite(widget.product.id)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: fav.isFavorite(widget.product.id)
                    ? AppColors.accentRed
                    : null,
              ),
              onPressed: () => fav.toggle(widget.product),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleAndRating(),
                  const SizedBox(height: 12),
                  _buildDescription(),
                  const SizedBox(height: 24),
                  _buildQuantitySelector(),
                  const SizedBox(height: 24),
                  _buildActions(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      height: 300,
      width: double.infinity,
      color: AppColors.creamBackground,
      child: Image.asset(
        widget.product.imageUrl,
        width: double.infinity,
        height: 300,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Center(
          child: Icon(Icons.cake_rounded,
              size: 120, color: AppColors.mediumBrown.withValues(alpha: 0.3)),
        ),
      ),
    );
  }

  Widget _buildTitleAndRating() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.product.name,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ...List.generate(
              5,
              (i) => Icon(
                i < widget.product.rating.floor()
                    ? Icons.star
                    : Icons.star_border,
                color: AppColors.warningYellow,
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${widget.product.rating} (${widget.product.reviewCount} تقييم)',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Text(
      widget.product.description,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.mediumBrown,
          ),
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        Text('الكمية: ',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
        GestureDetector(
          onTap: () => setState(() {
            if (_quantity > 1) _quantity--;
          }),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGray),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(Icons.remove, size: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '$_quantity',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: () => setState(() => _quantity++),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryBrown,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(Icons.add, size: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildActions() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () {
              for (int i = 0; i < _quantity; i++) {
                context.read<CartProvider>().addProduct(widget.product);
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('تمت الإضافة إلى السلة'),
                  backgroundColor: AppColors.successGreen,
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text('أضف إلى السلة'),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () => WhatsAppService.orderProduct(widget.product),
            icon: const Icon(Icons.chat),
            label: const Text('اطلب عبر واتساب'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondaryGold,
              foregroundColor: AppColors.darkBrown,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 900),
          padding: const EdgeInsets.all(48),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    widget.product.imageUrl,
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 400,
                      color: AppColors.creamBackground,
                      child: Center(
                        child: Icon(Icons.cake_rounded,
                            size: 150,
                            color: AppColors.mediumBrown.withValues(alpha: 0.3)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 48),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitleAndRating(),
                    const SizedBox(height: 16),
                    _buildDescription(),
                    const SizedBox(height: 24),
                    _buildQuantitySelector(),
                    const SizedBox(height: 32),
                    _buildActions(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
