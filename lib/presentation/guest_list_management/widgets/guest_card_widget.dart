import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../core/app_export.dart';

/// Individual guest card widget with swipe actions
/// Displays guest information with family categorization and invitation status
class GuestCardWidget extends StatelessWidget {
  final Map<String, dynamic> guest;
  final VoidCallback onTap;
  final VoidCallback onSendInvitation;
  final VoidCallback onMarkConfirmed;
  final VoidCallback onAssignSeating;
  final VoidCallback onEdit;
  final VoidCallback onRemove;

  const GuestCardWidget({
    super.key,
    required this.guest,
    required this.onTap,
    required this.onSendInvitation,
    required this.onMarkConfirmed,
    required this.onAssignSeating,
    required this.onEdit,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Determine status color
    Color statusColor;
    String statusText;
    switch (guest['status'] as String) {
      case 'confirmed':
        statusColor = const Color(0xFF28A745);
        statusText = 'Confirmed';
        break;
      case 'invited':
        statusColor = const Color(0xFFFFC107);
        statusText = 'Invited';
        break;
      case 'not_coming':
        statusColor = const Color(0xFFDC3545);
        statusText = 'Not Coming';
        break;
      default:
        statusColor = colorScheme.onSurfaceVariant;
        statusText = 'Pending';
    }

    return Slidable(
      key: ValueKey(guest['id']),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => onSendInvitation(),
            backgroundColor: const Color(0xFF50C878),
            foregroundColor: Colors.white,
            icon: Icons.send,
            label: 'Send',
          ),
          SlidableAction(
            onPressed: (_) => onMarkConfirmed(),
            backgroundColor: const Color(0xFF28A745),
            foregroundColor: Colors.white,
            icon: Icons.check_circle,
            label: 'Confirm',
          ),
          SlidableAction(
            onPressed: (_) => onAssignSeating(),
            backgroundColor: const Color(0xFFD4AF37),
            foregroundColor: Colors.white,
            icon: Icons.event_seat,
            label: 'Seating',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => onEdit(),
            backgroundColor: colorScheme.primary,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (_) => onRemove(),
            backgroundColor: const Color(0xFFDC3545),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Remove',
          ),
        ],
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Profile photo
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CustomImageWidget(
                    imageUrl: guest['photo'] as String,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    semanticLabel: guest['photoSemanticLabel'] as String,
                  ),
                ),
                const SizedBox(width: 16),
                // Guest information
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        guest['name'] as String,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        guest['relationship'] as String,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (guest['plusOne'] == true) ...[
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            CustomIconWidget(
                              iconName: 'person_add',
                              size: 14,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '+1 Guest',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.primary,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                // Status badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: statusColor.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    statusText,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: statusColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
