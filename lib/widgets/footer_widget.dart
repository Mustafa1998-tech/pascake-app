import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import '../config/constants.dart';
import '../providers/theme_provider.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().isDarkMode;

    return Container(
      color: isDark ? AppColors.darkSurface : AppColors.darkBrown,
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return _buildMobileFooter(context);
              } else {
                return _buildDesktopFooter(context);
              }
            },
          ),
          const SizedBox(height: 24),
          Divider(color: Colors.white.withValues(alpha: 0.2)),
          const SizedBox(height: 16),
          Text(
            '© 2026 Pascake Patisserie. All rights reserved.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.6),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAboutSection(context),
        const SizedBox(height: 24),
        _buildContactSection(context),
        const SizedBox(height: 24),
        _buildSocialSection(context),
      ],
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildAboutSection(context)),
        Expanded(child: _buildLinksSection(context)),
        Expanded(child: _buildContactSection(context)),
        Expanded(child: _buildSocialSection(context)),
      ],
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.cake_rounded, color: AppColors.secondaryGold, size: 28),
            const SizedBox(width: 8),
            Text(
              'Pascake',
              style: TextStyle(
                color: AppColors.secondaryGold,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'PlayfairDisplay',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Handcrafted with the finest ingredients. Your moments, our passion.',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildLinksSection(BuildContext context) {
    final links = ['Home', 'Shop', 'About Us', 'Custom Cakes', 'Contact'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: TextStyle(
            color: AppColors.secondaryGold,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...links.map((link) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                link,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 14,
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Info',
          style: TextStyle(
            color: AppColors.secondaryGold,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        _contactRow(Icons.phone, AppConstants.phoneNumber, () {
          launchUrl(Uri.parse('tel:${AppConstants.phoneNumber}'));
        }),
        const SizedBox(height: 8),
        _contactRow(Icons.email, AppConstants.email, () {
          launchUrl(Uri.parse('mailto:${AppConstants.email}'));
        }),
        const SizedBox(height: 8),
        _contactRow(Icons.location_on, AppConstants.address, null),
        const SizedBox(height: 8),
        _contactRow(Icons.access_time, AppConstants.workHours, null),
      ],
    );
  }

  Widget _contactRow(IconData icon, String text, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.secondaryGold),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Follow Us',
          style: TextStyle(
            color: AppColors.secondaryGold,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _socialIcon(Icons.chat, () {
              launchUrl(
                  Uri.parse('https://wa.me/${AppConstants.whatsappNumber}'));
            }),
            const SizedBox(width: 12),
            _socialIcon(Icons.phone, () {
              launchUrl(Uri.parse('tel:${AppConstants.phoneNumber}'));
            }),
            const SizedBox(width: 12),
            _socialIcon(Icons.email, () {
              launchUrl(Uri.parse('mailto:${AppConstants.email}'));
            }),
            const SizedBox(width: 12),
            _socialIcon(Icons.camera_alt, () {
              launchUrl(Uri.parse(AppConstants.instagram));
            }),
            const SizedBox(width: 12),
            _socialIcon(Icons.location_on, () {
              launchUrl(Uri.parse(
                  'https://maps.google.com/?q=${AppConstants.address}'));
            }),
          ],
        ),
      ],
    );
  }

  Widget _socialIcon(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppColors.secondaryGold, size: 20),
      ),
    );
  }
}
