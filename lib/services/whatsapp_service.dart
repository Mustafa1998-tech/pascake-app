import 'package:url_launcher/url_launcher.dart';
import '../config/constants.dart';
import '../models/product.dart';
import '../models/cart_item.dart';

class WhatsAppService {
  static Future<void> orderProduct(Product product) async {
    final message = Uri.encodeComponent(
      'مرحباً Pascake! 👋\n'
      'أود طلب: ${product.name}\n'
      'شكراً! 🍰',
    );
    final url = 'https://wa.me/${AppConstants.whatsappNumber}?text=$message';
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  static Future<void> orderCart(List<CartItem> items, double total) async {
    String itemsList = items
        .map((item) => '• ${item.product.name} x${item.quantity}')
        .join('\n');

    final message = Uri.encodeComponent(
      'مرحباً Pascake! 👋\n'
      'أود طلب:\n'
      '$itemsList\n'
      'شكراً! 🍰',
    );
    final url = 'https://wa.me/${AppConstants.whatsappNumber}?text=$message';
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  static Future<void> orderCustomCake(Map<String, String> details) async {
    final message = Uri.encodeComponent(
      'طلب كعكة مخصصة:\n'
      'الاسم: ${details['name']}\n'
      'الحجم: ${details['size']}\n'
      'النكهة: ${details['flavor']}\n'
      'الزخرفة: ${details['decoration']}\n'
      'تاريخ التسليم: ${details['date']}\n'
      'ملاحظات: ${details['notes']}\n'
      'شكراً! 🎂',
    );
    final url = 'https://wa.me/${AppConstants.whatsappNumber}?text=$message';
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  static Future<void> contactUs() async {
    final message = Uri.encodeComponent(
      'مرحباً Pascake! 🙋\n'
      'أود الاستفسار عن...\n'
      'شكراً!',
    );
    final url = 'https://wa.me/${AppConstants.whatsappNumber}?text=$message';
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}
