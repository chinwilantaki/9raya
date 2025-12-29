import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

/// Payment method selector widget
/// Supports cash, bank transfer, and installment options
class PaymentMethodWidget extends StatelessWidget {
  final String selectedMethod;
  final Function(String) onMethodSelected;

  const PaymentMethodWidget({
    super.key,
    required this.selectedMethod,
    required this.onMethodSelected,
  });

  final List<Map<String, dynamic>> _paymentMethods = const [
    {
      'id': 'cash',
      'label': 'Cash',
      'icon': 'payments',
      'description': 'Pay with cash',
    },
    {
      'id': 'bank_transfer',
      'label': 'Bank Transfer',
      'icon': 'account_balance',
      'description': 'Transfer from bank account',
    },
    {
      'id': 'installment',
      'label': 'Installment',
      'icon': 'schedule',
      'description': 'Pay in multiple installments',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Method',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        Column(
          children: _paymentMethods.map((method) {
            final isSelected = method['id'] == selectedMethod;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _PaymentMethodTile(
                label: method['label'] as String,
                icon: method['icon'] as String,
                description: method['description'] as String,
                isSelected: isSelected,
                onTap: () => onMethodSelected(method['id'] as String),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

/// Individual payment method tile
class _PaymentMethodTile extends StatelessWidget {
  final String label;
  final String icon;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentMethodTile({
    required this.label,
    required this.icon,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected
                ? theme.colorScheme.primary.withValues(alpha: 0.1)
                : theme.colorScheme.surface,
            border: Border.all(
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.outline,
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.outline,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: CustomIconWidget(
                    iconName: icon,
                    color: isSelected
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onSurfaceVariant,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                CustomIconWidget(
                  iconName: 'check_circle',
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
