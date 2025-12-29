import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

/// Add guest dialog with family categorization
/// Provides form for adding new guests with relationship selection
class AddGuestDialogWidget extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddGuest;

  const AddGuestDialogWidget({super.key, required this.onAddGuest});

  @override
  State<AddGuestDialogWidget> createState() => _AddGuestDialogWidgetState();
}

class _AddGuestDialogWidgetState extends State<AddGuestDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  String _selectedFamily = 'bride';
  String _selectedRelationship = 'Family Member';
  bool _hasPlusOne = false;

  final List<String> _relationships = [
    'Family Member',
    'Close Friend',
    'Colleague',
    'Neighbor',
    'Extended Family',
    'Other',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add Guest',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      IconButton(
                        icon: CustomIconWidget(
                          iconName: 'close',
                          size: 24,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Name field
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Full Name *',
                      hintText: 'Enter guest name',
                      prefixIcon: CustomIconWidget(
                        iconName: 'person',
                        size: 20,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter guest name';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  // Phone field
                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter phone number',
                      prefixIcon: CustomIconWidget(
                        iconName: 'phone',
                        size: 20,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  // Email field
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'Enter email address',
                      prefixIcon: CustomIconWidget(
                        iconName: 'email',
                        size: 20,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 24),
                  // Family side selection
                  Text(
                    'Family Side *',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildFamilyOption(
                          context,
                          'bride',
                          'Bride Family',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildFamilyOption(
                          context,
                          'groom',
                          'Groom Family',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Relationship dropdown
                  DropdownButtonFormField<String>(
                    initialValue: _selectedRelationship,
                    decoration: InputDecoration(
                      labelText: 'Relationship *',
                      prefixIcon: CustomIconWidget(
                        iconName: 'people',
                        size: 20,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    items: _relationships.map((relationship) {
                      return DropdownMenuItem(
                        value: relationship,
                        child: Text(relationship),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedRelationship = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  // Plus one checkbox
                  CheckboxListTile(
                    value: _hasPlusOne,
                    onChanged: (value) {
                      setState(() {
                        _hasPlusOne = value ?? false;
                      });
                    },
                    title: Text(
                      'Allow +1 Guest',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                  ),
                  const SizedBox(height: 24),
                  // Action buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Cancel',
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: _handleAddGuest,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: Text(
                          'Add Guest',
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFamilyOption(BuildContext context, String value, String label) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isSelected = _selectedFamily == value;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedFamily = value;
          });
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? colorScheme.primary.withValues(alpha: 0.1)
                : colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.outline.withValues(alpha: 0.3),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isSelected)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CustomIconWidget(
                    iconName: 'check_circle',
                    size: 18,
                    color: colorScheme.primary,
                  ),
                ),
              Text(
                label,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: isSelected
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleAddGuest() {
    if (_formKey.currentState!.validate()) {
      final newGuest = {
        'id': DateTime.now().millisecondsSinceEpoch,
        'name': _nameController.text.trim(),
        'phone': _phoneController.text.trim(),
        'email': _emailController.text.trim(),
        'family': _selectedFamily,
        'relationship': _selectedRelationship,
        'status': 'pending',
        'plusOne': _hasPlusOne,
        'photo':
            'https://img.rocket.new/generatedImages/rocket_gen_img_172dbc958-1766945065418.png',
        'photoSemanticLabel': 'Default guest profile photo',
      };

      widget.onAddGuest(newGuest);
      Navigator.pop(context);
    }
  }
}
