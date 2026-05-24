import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/constants.dart';
import '../providers/theme_provider.dart';
import '../services/whatsapp_service.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حسابي')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32),
            _buildProfileHeader(context),
            const SizedBox(height: 24),
            _buildSettingsSection(context),
            const SizedBox(height: 24),
            _buildContactSection(context),
            const SizedBox(height: 24),
            _buildRecentOrders(context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: AppColors.primaryBrown,
          child: const Icon(Icons.person, size: 50, color: Colors.white),
        ),
        const SizedBox(height: 16),
        Text(
          'عميل Pascake',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 4),
        Text(
          'pascake@bakery.com',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.lightCream,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppShadows.elevation1,
      ),
      child: Column(
        children: [
          SwitchListTile(
            title: Text('الوضع الليلي',
                style: Theme.of(context).textTheme.bodyMedium),
            subtitle: Text('تغيير مظهر التطبيق',
                style: Theme.of(context).textTheme.bodySmall),
            value: themeProvider.isDarkMode,
            onChanged: (_) => themeProvider.toggleTheme(),
            activeTrackColor: AppColors.primaryBrown,
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.lightCream,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppShadows.elevation1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('تواصل معنا',
                style: Theme.of(context).textTheme.headlineMedium),
          ),
          _contactTile(
            context,
            icon: Icons.chat,
            title: 'واتساب',
            subtitle: AppConstants.phoneNumber,
            color: AppColors.whatsappGreen,
            onTap: () => WhatsAppService.contactUs(),
          ),
          _contactTile(
            context,
            icon: Icons.phone,
            title: 'الهاتف',
            subtitle: AppConstants.phoneNumber,
            onTap: () =>
                launchUrl(Uri.parse('tel:${AppConstants.phoneNumber}')),
          ),
          _contactTile(
            context,
            icon: Icons.email,
            title: 'البريد الإلكتروني',
            subtitle: AppConstants.email,
            onTap: () =>
                launchUrl(Uri.parse('mailto:${AppConstants.email}')),
          ),
          _contactTile(
            context,
            icon: Icons.camera_alt,
            title: 'إنستغرام',
            subtitle: '@_pascake',
            color: const Color(0xFFE4405F),
            onTap: () =>
                launchUrl(Uri.parse(AppConstants.instagram)),
          ),
          _contactTile(
            context,
            icon: Icons.location_on,
            title: 'العنوان',
            subtitle: AppConstants.address,
            color: AppColors.accentRed,
          ),
          _contactTile(
            context,
            icon: Icons.access_time,
            title: 'ساعات العمل',
            subtitle: AppConstants.workHours,
            color: AppColors.successGreen,
          ),
        ],
      ),
    );
  }

  Widget _contactTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    Color? color,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color ?? AppColors.primaryBrown),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
      onTap: onTap,
    );
  }

  Widget _buildRecentOrders(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.lightCream,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppShadows.elevation1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('آخر الطلبات',
                style: Theme.of(context).textTheme.headlineMedium),
          ),
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.creamBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.cake_rounded,
                  color: AppColors.mediumBrown),
            ),
            title: Text('كعكة الشوكولاتة الفاخرة',
                style: Theme.of(context).textTheme.bodyMedium),
            subtitle: Text('تم التسليم - 120 ر.س',
                style: Theme.of(context).textTheme.bodySmall),
            trailing: Icon(Icons.check_circle,
                color: AppColors.successGreen, size: 20),
          ),
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.creamBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.cake_rounded,
                  color: AppColors.mediumBrown),
            ),
            title: Text('كرواسون الزبدة',
                style: Theme.of(context).textTheme.bodyMedium),
            subtitle: Text('تم التسليم - 25 ر.س',
                style: Theme.of(context).textTheme.bodySmall),
            trailing: Icon(Icons.check_circle,
                color: AppColors.successGreen, size: 20),
          ),
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.creamBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.cake_rounded,
                  color: AppColors.mediumBrown),
            ),
            title: Text('تشيز كيك التوت',
                style: Theme.of(context).textTheme.bodyMedium),
            subtitle: Text('قيد التوصيل - 95 ر.س',
                style: Theme.of(context).textTheme.bodySmall),
            trailing: Icon(Icons.local_shipping,
                color: AppColors.warningYellow, size: 20),
          ),
        ],
      ),
    );
  }
}
