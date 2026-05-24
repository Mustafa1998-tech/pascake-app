import 'package:flutter/material.dart';
import '../config/constants.dart';
import '../services/whatsapp_service.dart';
import '../widgets/responsive_layout.dart';

class CustomCakesScreen extends StatefulWidget {
  const CustomCakesScreen({super.key});

  @override
  State<CustomCakesScreen> createState() => _CustomCakesScreenState();
}

class _CustomCakesScreenState extends State<CustomCakesScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _decorationController = TextEditingController();
  final _notesController = TextEditingController();

  String _selectedSize = 'Medium';
  String _selectedFlavor = 'Chocolate';
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 3));

  final List<String> _sizes = ['Small', 'Medium', 'Large', 'Extra Large'];
  final List<String> _flavors = [
    'Chocolate',
    'Vanilla',
    'Strawberry',
    'Red Velvet',
    'Lemon',
    'Carrot',
    'Coffee',
    'Pistachio',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _decorationController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColors.primaryBrown,
            onPrimary: Colors.white,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  void _sendOrder() {
    if (!_formKey.currentState!.validate()) return;

    final details = {
      'name': _nameController.text,
      'size': _selectedSize,
      'flavor': _selectedFlavor,
      'decoration': _decorationController.text,
      'date':
          '${_selectedDate.year}/${_selectedDate.month}/${_selectedDate.day}',
      'notes': _notesController.text,
    };

    WhatsAppService.orderCustomCake(details);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('اطلب كعكتك المخصصة')),
      body: ResponsiveLayout(
        mobile: _buildMobileForm(),
        desktop: _buildDesktopForm(),
      ),
    );
  }

  Widget _buildMobileForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: _buildForm(),
      ),
    );
  }

  Widget _buildDesktopForm() {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900),
        padding: const EdgeInsets.all(48),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryBrown.withValues(alpha: 0.1),
                      AppColors.creamBackground,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cake_rounded,
                          size: 120,
                          color: AppColors.mediumBrown.withValues(alpha: 0.3)),
                      const SizedBox(height: 16),
                      Text('صمم كعكتك المثالية',
                          style: Theme.of(context).textTheme.displaySmall),
                      const SizedBox(height: 8),
                      Text(
                        'اختر النكهة والحجم والزخرفة\nوسنصنعها خصيصاً لك',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.mediumBrown,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 48),
            Expanded(child: _buildForm()),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('صمم كعكتك المثالية',
              style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: 24),
          _buildTextField(
            controller: _nameController,
            label: 'اسم الكعكة',
            hint: 'أدخل اسم الكعكة',
            validator: (v) => v?.isEmpty ?? true ? 'هذا الحقل مطلوب' : null,
          ),
          const SizedBox(height: 16),
          _buildDropdown('الحجم', _selectedSize, _sizes, (v) {
            setState(() => _selectedSize = v!);
          }),
          const SizedBox(height: 16),
          _buildDropdown('النكهة', _selectedFlavor, _flavors, (v) {
            setState(() => _selectedFlavor = v!);
          }),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _decorationController,
            label: 'الزخرفة',
            hint: 'وصف الزخرفة المطلوبة',
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: _pickDate,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.lightCream,
                border: Border.all(color: AppColors.lightGray),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'تاريخ التسليم: ${_selectedDate.year}/${_selectedDate.month}/${_selectedDate.day}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Icon(Icons.calendar_today,
                      color: AppColors.primaryBrown, size: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _notesController,
            label: 'ملاحظات إضافية',
            hint: 'أي ملاحظات إضافية...',
            maxLines: 3,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: _sendOrder,
              icon: const Icon(Icons.chat),
              label: const Text('أرسل الطلب عبر واتساب'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.whatsappGreen,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      maxLines: maxLines,
      validator: validator,
    );
  }

  Widget _buildDropdown(
    String label,
    String value,
    List<String> items,
    ValueChanged<String?> onChanged,
  ) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: InputDecoration(labelText: label),
      items: items.map((item) {
        return DropdownMenuItem(value: item, child: Text(item));
      }).toList(),
      onChanged: onChanged,
    );
  }
}
