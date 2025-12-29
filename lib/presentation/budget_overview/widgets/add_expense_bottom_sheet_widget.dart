import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

/// Add Expense Bottom Sheet Widget
/// Modal bottom sheet for adding new expenses with category selection,
/// amount input, description, and receipt photo capture
class AddExpenseBottomSheetWidget extends StatefulWidget {
  final List<Map<String, dynamic>> categories;
  final Function(Map<String, dynamic>) onExpenseAdded;

  const AddExpenseBottomSheetWidget({
    super.key,
    required this.categories,
    required this.onExpenseAdded,
  });

  @override
  State<AddExpenseBottomSheetWidget> createState() =>
      _AddExpenseBottomSheetWidgetState();
}

class _AddExpenseBottomSheetWidgetState
    extends State<AddExpenseBottomSheetWidget> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imagePicker = ImagePicker();

  Map<String, dynamic>? _selectedCategory;
  XFile? _receiptImage;

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle Bar
                Center(
                  child: Container(
                    width: 12.w,
                    height: 0.5.h,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.outline.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),

                // Title
                Text(
                  'Add Expense',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 2.h),

                // Category Selection
                Text(
                  'Category',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 1.h),
                Wrap(
                  spacing: 2.w,
                  runSpacing: 1.h,
                  children: widget.categories.map((category) {
                    final isSelected = _selectedCategory == category;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3.w,
                          vertical: 1.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Color(
                                  category["color"] as int,
                                ).withValues(alpha: 0.2)
                              : theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected
                                ? Color(category["color"] as int)
                                : theme.colorScheme.outline.withValues(
                                    alpha: 0.3,
                                  ),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomIconWidget(
                              iconName: category["icon"] as String,
                              color: isSelected
                                  ? Color(category["color"] as int)
                                  : theme.colorScheme.onSurfaceVariant,
                              size: 18,
                            ),
                            SizedBox(width: 1.w),
                            Text(
                              category["name"] as String,
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: isSelected
                                    ? Color(category["color"] as int)
                                    : theme.colorScheme.onSurfaceVariant,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 2.h),

                // Amount Input
                Text(
                  'Amount (MAD)',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 1.h),
                TextFormField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: 'Enter amount',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(3.w),
                      child: Text(
                        'MAD',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter amount';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),

                // Description Input
                Text(
                  'Description',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 1.h),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: 'Enter description',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),

                // Receipt Photo
                Text(
                  'Receipt Photo (Optional)',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: _pickImageFromCamera,
                      icon: CustomIconWidget(
                        iconName: 'camera_alt',
                        color: theme.colorScheme.primary,
                        size: 20,
                      ),
                      label: const Text('Camera'),
                    ),
                    SizedBox(width: 2.w),
                    OutlinedButton.icon(
                      onPressed: _pickImageFromGallery,
                      icon: CustomIconWidget(
                        iconName: 'photo_library',
                        color: theme.colorScheme.primary,
                        size: 20,
                      ),
                      label: const Text('Gallery'),
                    ),
                  ],
                ),
                if (_receiptImage != null) ...[
                  SizedBox(height: 1.h),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CustomImageWidget(
                          imageUrl: _receiptImage!.path,
                          width: double.infinity,
                          height: 20.h,
                          fit: BoxFit.cover,
                          semanticLabel: 'Receipt photo preview',
                        ),
                      ),
                      Positioned(
                        top: 1.h,
                        right: 2.w,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _receiptImage = null;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(1.w),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.error,
                              shape: BoxShape.circle,
                            ),
                            child: CustomIconWidget(
                              iconName: 'close',
                              color: theme.colorScheme.onError,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                SizedBox(height: 3.h),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _saveExpense,
                        child: const Text('Save'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );
      if (image != null) {
        setState(() {
          _receiptImage = image;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to capture photo')),
        );
      }
    }
  }

  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );
      if (image != null) {
        setState(() {
          _receiptImage = image;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Failed to select photo')));
      }
    }
  }

  void _saveExpense() {
    if (_formKey.currentState!.validate()) {
      if (_selectedCategory == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a category')),
        );
        return;
      }

      final expense = {
        "id": DateTime.now().millisecondsSinceEpoch,
        "category": _selectedCategory!["name"],
        "categoryAr": _selectedCategory!["nameAr"],
        "amount": double.parse(_amountController.text),
        "description": _descriptionController.text,
        "descriptionAr": _descriptionController.text,
        "date": DateTime.now(),
        "receipt": _receiptImage?.path,
        "semanticLabel": "Receipt photo for ${_descriptionController.text}",
      };

      widget.onExpenseAdded(expense);
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Expense added successfully')),
      );
    }
  }
}
