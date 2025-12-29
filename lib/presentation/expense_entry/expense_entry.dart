import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';
import './widgets/amount_input_widget.dart';
import './widgets/category_selector_widget.dart';
import './widgets/expense_form_widget.dart';
import './widgets/payment_method_widget.dart';
import './widgets/receipt_capture_widget.dart';

/// Expense Entry Screen for Moroccan Wedding Planner
/// Enables quick and accurate financial transaction logging with cultural expense categories
class ExpenseEntry extends StatefulWidget {
  const ExpenseEntry({super.key});

  @override
  State<ExpenseEntry> createState() => _ExpenseEntryState();
}

class _ExpenseEntryState extends State<ExpenseEntry> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String _selectedCategory = 'venue';
  DateTime _selectedDate = DateTime.now();
  String? _selectedVendor;
  String _selectedPaymentMethod = 'cash';
  String? _capturedImagePath;
  bool _isSaving = false;
  bool _hasUnsavedChanges = false;

  // Moroccan wedding expense categories with cultural icons
  final List<Map<String, dynamic>> _expenseCategories = [
    {
      'id': 'venue',
      'label': 'Venue',
      'icon': 'location_city',
      'color': const Color(0xFFD4AF37),
    },
    {
      'id': 'catering',
      'label': 'Catering',
      'icon': 'restaurant',
      'color': const Color(0xFF50C878),
    },
    {
      'id': 'neggafa',
      'label': 'Neggafa',
      'icon': 'face',
      'color': const Color(0xFFD4AF37),
    },
    {
      'id': 'band',
      'label': 'Traditional Band',
      'icon': 'music_note',
      'color': const Color(0xFF50C878),
    },
    {
      'id': 'photographer',
      'label': 'Photographer',
      'icon': 'camera_alt',
      'color': const Color(0xFFD4AF37),
    },
    {
      'id': 'henna',
      'label': 'Henna Artist',
      'icon': 'brush',
      'color': const Color(0xFF50C878),
    },
    {
      'id': 'decoration',
      'label': 'Decoration',
      'icon': 'celebration',
      'color': const Color(0xFFD4AF37),
    },
  ];

  // Mock vendor data linked to categories
  final Map<String, List<Map<String, String>>> _vendorsByCategory = {
    'venue': [
      {'id': '1', 'name': 'Palais des Congrès'},
      {'id': '2', 'name': 'Riad Fes'},
      {'id': '3', 'name': 'La Mamounia'},
    ],
    'catering': [
      {'id': '4', 'name': 'Traiteur Marocain'},
      {'id': '5', 'name': 'Délices du Maroc'},
    ],
    'neggafa': [
      {'id': '6', 'name': 'Neggafa Fatima'},
      {'id': '7', 'name': 'Neggafa Khadija'},
    ],
    'band': [
      {'id': '8', 'name': 'Orchestre Andalous'},
      {'id': '9', 'name': 'Groupe Chaabi'},
    ],
    'photographer': [
      {'id': '10', 'name': 'Studio Photo Marrakech'},
      {'id': '11', 'name': 'Lens & Light'},
    ],
    'henna': [
      {'id': '12', 'name': 'Henna Art Casablanca'},
      {'id': '13', 'name': 'Traditional Henna'},
    ],
    'decoration': [
      {'id': '14', 'name': 'Décor Marocain'},
      {'id': '15', 'name': 'Fleurs & Lumières'},
    ],
  };

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _onCategorySelected(String categoryId) {
    setState(() {
      _selectedCategory = categoryId;
      _selectedVendor = null; // Reset vendor when category changes
      _hasUnsavedChanges = true;
    });
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
      _hasUnsavedChanges = true;
    });
  }

  void _onVendorSelected(String? vendorId) {
    setState(() {
      _selectedVendor = vendorId;
      _hasUnsavedChanges = true;
    });
  }

  void _onPaymentMethodSelected(String method) {
    setState(() {
      _selectedPaymentMethod = method;
      _hasUnsavedChanges = true;
    });
  }

  void _onImageCaptured(String? imagePath) {
    setState(() {
      _capturedImagePath = imagePath;
      _hasUnsavedChanges = true;
    });
  }

  void _onFormChanged() {
    if (!_hasUnsavedChanges) {
      setState(() {
        _hasUnsavedChanges = true;
      });
    }
  }

  Future<void> _saveExpense() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    // Simulate save operation
    await Future.delayed(const Duration(milliseconds: 800));

    if (!mounted) return;

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Expense saved successfully',
          style: Theme.of(context).snackBarTheme.contentTextStyle,
        ),
        backgroundColor: const Color(0xFF28A745),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );

    setState(() {
      _isSaving = false;
      _hasUnsavedChanges = false;
    });

    // Navigate back to budget overview
    Navigator.pop(context);
  }

  Future<bool?> _showDiscardChangesDialog() async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Discard Changes?',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: Text(
          'You have unsaved changes. Are you sure you want to discard them?',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'Cancel',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              'Discard',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopScope(
      canPop: !_hasUnsavedChanges,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) {
          return;
        }
        if (await _showDiscardChangesDialog() ?? false) {
          if (mounted) {
            Navigator.pop(context);
          }
        }
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: CustomAppBar.withBack(
          title: 'Add Expense',
          onBackPressed: () async {
            if (_hasUnsavedChanges) {
              if (await _showDiscardChangesDialog() ?? false) {
                if (mounted) {
                  Navigator.pop(context);
                }
              }
            } else {
              if (mounted) {
                Navigator.pop(context);
              }
            }
          },
          actions: [
            TextButton(
              onPressed: _isSaving ? null : _saveExpense,
              child: Text(
                'Done',
                style: TextStyle(
                  color: _isSaving
                      ? theme.colorScheme.onSurfaceVariant
                      : theme.colorScheme.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Selector
                  CategorySelectorWidget(
                    categories: _expenseCategories,
                    selectedCategory: _selectedCategory,
                    onCategorySelected: _onCategorySelected,
                  ),
                  const SizedBox(height: 24),

                  // Amount Input
                  AmountInputWidget(
                    controller: _amountController,
                    onChanged: (_) => _onFormChanged(),
                  ),
                  const SizedBox(height: 24),

                  // Expense Form (Description, Date, Vendor)
                  ExpenseFormWidget(
                    descriptionController: _descriptionController,
                    selectedDate: _selectedDate,
                    selectedVendor: _selectedVendor,
                    vendors: _vendorsByCategory[_selectedCategory] ?? [],
                    onDateSelected: _onDateSelected,
                    onVendorSelected: _onVendorSelected,
                    onDescriptionChanged: (_) => _onFormChanged(),
                  ),
                  const SizedBox(height: 24),

                  // Receipt Capture
                  ReceiptCaptureWidget(
                    capturedImagePath: _capturedImagePath,
                    onImageCaptured: _onImageCaptured,
                  ),
                  const SizedBox(height: 24),

                  // Payment Method
                  PaymentMethodWidget(
                    selectedMethod: _selectedPaymentMethod,
                    onMethodSelected: _onPaymentMethodSelected,
                  ),
                  const SizedBox(height: 32),

                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _isSaving ? null : _saveExpense,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: _isSaving
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  theme.colorScheme.onPrimary,
                                ),
                              ),
                            )
                          : Text(
                              'Save Expense',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.25,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
