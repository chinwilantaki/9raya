import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import './widgets/add_guest_dialog_widget.dart';
import './widgets/family_segment_widget.dart';
import './widgets/filter_bottom_sheet_widget.dart';
import './widgets/guest_card_widget.dart';
import './widgets/search_bar_widget.dart';

/// Guest List Management Screen
/// Provides comprehensive guest organization with traditional Moroccan family categorization
class GuestListManagement extends StatefulWidget {
  const GuestListManagement({super.key});

  @override
  State<GuestListManagement> createState() => _GuestListManagementState();
}

class _GuestListManagementState extends State<GuestListManagement> {
  String _selectedSegment = 'all';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  Map<String, dynamic> _activeFilters = {
    'status': null,
    'family': null,
    'attendance': null,
  };
  bool _isMultiSelectMode = false;
  final Set<int> _selectedGuestIds = {};

  // Mock guest data with Moroccan names and cultural relationships
  final List<Map<String, dynamic>> _allGuests = [
    {
      'id': 1,
      'name': 'Fatima Zahra El Amrani',
      'family': 'bride',
      'relationship': 'Sister',
      'status': 'confirmed',
      'plusOne': true,
      'phone': '+212 6 12 34 56 78',
      'email': 'fatima.elamrani@email.com',
      'photo':
          'https://images.unsplash.com/photo-1649140337818-5921f2a6af7d',
      'photoSemanticLabel':
          'Young woman with long dark hair wearing traditional Moroccan kaftan in emerald green',
    },
    {
      'id': 2,
      'name': 'Mohammed Benali',
      'family': 'groom',
      'relationship': 'Brother',
      'status': 'confirmed',
      'plusOne': false,
      'phone': '+212 6 23 45 67 89',
      'email': 'mohammed.benali@email.com',
      'photo':
          'https://img.rocket.new/generatedImages/rocket_gen_img_1b4710b43-1763294093140.png',
      'photoSemanticLabel':
          'Middle-aged man with short black hair and beard wearing traditional white djellaba',
    },
    {
      'id': 3,
      'name': 'Amina Alaoui',
      'family': 'bride',
      'relationship': 'Close Friend',
      'status': 'invited',
      'plusOne': true,
      'phone': '+212 6 34 56 78 90',
      'email': 'amina.alaoui@email.com',
      'photo':
          'https://images.unsplash.com/photo-1639851019794-e50127767ad4',
      'photoSemanticLabel':
          'Young woman with curly dark hair wearing gold jewelry and traditional Moroccan makeup',
    },
    {
      'id': 4,
      'name': 'Youssef Tazi',
      'family': 'groom',
      'relationship': 'Cousin',
      'status': 'confirmed',
      'plusOne': false,
      'phone': '+212 6 45 67 89 01',
      'email': 'youssef.tazi@email.com',
      'photo':
          'https://img.rocket.new/generatedImages/rocket_gen_img_1acf568a1-1763296290712.png',
      'photoSemanticLabel':
          'Young man with short dark hair wearing modern suit with traditional Moroccan embroidery',
    },
    {
      'id': 5,
      'name': 'Khadija Idrissi',
      'family': 'bride',
      'relationship': 'Aunt',
      'status': 'not_coming',
      'plusOne': false,
      'phone': '+212 6 56 78 90 12',
      'email': 'khadija.idrissi@email.com',
      'photo':
          'https://img.rocket.new/generatedImages/rocket_gen_img_103540deb-1766945068099.png',
      'photoSemanticLabel':
          'Older woman with gray-streaked hair wearing elegant traditional Moroccan takchita',
    },
    {
      'id': 6,
      'name': 'Omar Fassi',
      'family': 'groom',
      'relationship': 'Uncle',
      'status': 'invited',
      'plusOne': true,
      'phone': '+212 6 67 89 01 23',
      'email': 'omar.fassi@email.com',
      'photo':
          'https://images.unsplash.com/photo-1728296156183-e1c4735b5cb3',
      'photoSemanticLabel':
          'Middle-aged man with graying beard wearing traditional brown djellaba and red fez',
    },
    {
      'id': 7,
      'name': 'Salma Berrada',
      'family': 'bride',
      'relationship': 'Colleague',
      'status': 'pending',
      'plusOne': false,
      'phone': '+212 6 78 90 12 34',
      'email': 'salma.berrada@email.com',
      'photo':
          'https://img.rocket.new/generatedImages/rocket_gen_img_1f3387869-1763301386730.png',
      'photoSemanticLabel':
          'Professional woman with shoulder-length dark hair wearing modern business attire',
    },
    {
      'id': 8,
      'name': 'Rachid Lahlou',
      'family': 'groom',
      'relationship': 'Close Friend',
      'status': 'confirmed',
      'plusOne': true,
      'phone': '+212 6 89 01 23 45',
      'email': 'rachid.lahlou@email.com',
      'photo':
          'https://img.rocket.new/generatedImages/rocket_gen_img_1c4758a9f-1763295793409.png',
      'photoSemanticLabel':
          'Young man with styled dark hair wearing navy blue suit with gold tie',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredGuests {
    List<Map<String, dynamic>> filtered = _allGuests;

    // Apply segment filter
    if (_selectedSegment != 'all') {
      filtered = filtered
          .where((guest) => guest['family'] == _selectedSegment)
          .toList();
    }

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((guest) {
        final name = (guest['name'] as String).toLowerCase();
        final relationship = (guest['relationship'] as String).toLowerCase();
        final query = _searchQuery.toLowerCase();
        return name.contains(query) || relationship.contains(query);
      }).toList();
    }

    // Apply active filters
    if (_activeFilters['status'] != null) {
      filtered = filtered
          .where((guest) => guest['status'] == _activeFilters['status'])
          .toList();
    }
    if (_activeFilters['family'] != null) {
      filtered = filtered
          .where((guest) => guest['family'] == _activeFilters['family'])
          .toList();
    }

    return filtered;
  }

  int get _brideCount => _allGuests.where((g) => g['family'] == 'bride').length;
  int get _groomCount => _allGuests.where((g) => g['family'] == 'groom').length;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'Guest List',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: CustomIconWidget(
              iconName: 'filter_list',
              size: 24,
              color: colorScheme.onSurface,
            ),
            onPressed: _showFilterBottomSheet,
            tooltip: 'Filter',
          ),
          if (_isMultiSelectMode)
            IconButton(
              icon: CustomIconWidget(
                iconName: 'close',
                size: 24,
                color: colorScheme.onSurface,
              ),
              onPressed: () {
                setState(() {
                  _isMultiSelectMode = false;
                  _selectedGuestIds.clear();
                });
              },
              tooltip: 'Cancel',
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: Column(
          children: [
            // Family segment control
            FamilySegmentWidget(
              selectedSegment: _selectedSegment,
              onSegmentChanged: (segment) {
                setState(() {
                  _selectedSegment = segment;
                });
              },
              brideCount: _brideCount,
              groomCount: _groomCount,
              totalCount: _allGuests.length,
            ),
            // Search bar
            SearchBarWidget(
              controller: _searchController,
              onSearchChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
            // Active filters indicator
            if (_activeFilters.values.any((v) => v != null))
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: colorScheme.primary.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    CustomIconWidget(
                      iconName: 'filter_alt',
                      size: 16,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Filters active',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _activeFilters = {
                            'status': null,
                            'family': null,
                            'attendance': null,
                          };
                        });
                      },
                      child: Text(
                        'Clear',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            // Multi-select toolbar
            if (_isMultiSelectMode && _selectedGuestIds.isNotEmpty)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text(
                      '${_selectedGuestIds.length} selected',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    TextButton.icon(
                      onPressed: _handleBatchInvitation,
                      icon: CustomIconWidget(
                        iconName: 'send',
                        size: 18,
                        color: colorScheme.primary,
                      ),
                      label: Text(
                        'Send Invites',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            // Guest list
            Expanded(
              child: _filteredGuests.isEmpty
                  ? _buildEmptyState(context)
                  : ListView.builder(
                      itemCount: _filteredGuests.length,
                      padding: const EdgeInsets.only(bottom: 80),
                      itemBuilder: (context, index) {
                        final guest = _filteredGuests[index];
                        final isSelected = _selectedGuestIds.contains(
                          guest['id'],
                        );

                        return GestureDetector(
                          onLongPress: () {
                            setState(() {
                              _isMultiSelectMode = true;
                              _selectedGuestIds.add(guest['id'] as int);
                            });
                          },
                          child: Stack(
                            children: [
                              GuestCardWidget(
                                guest: guest,
                                onTap: () {
                                  if (_isMultiSelectMode) {
                                    setState(() {
                                      if (isSelected) {
                                        _selectedGuestIds.remove(guest['id']);
                                      } else {
                                        _selectedGuestIds.add(
                                          guest['id'] as int,
                                        );
                                      }
                                    });
                                  } else {
                                    _showGuestDetails(guest);
                                  }
                                },
                                onSendInvitation: () =>
                                    _handleSendInvitation(guest),
                                onMarkConfirmed: () =>
                                    _handleMarkConfirmed(guest),
                                onAssignSeating: () =>
                                    _handleAssignSeating(guest),
                                onEdit: () => _handleEditGuest(guest),
                                onRemove: () => _handleRemoveGuest(guest),
                              ),
                              if (_isMultiSelectMode)
                                Positioned(
                                  right: 24,
                                  top: 16,
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? colorScheme.primary
                                          : colorScheme.surface,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isSelected
                                            ? colorScheme.primary
                                            : colorScheme.outline,
                                        width: 2,
                                      ),
                                    ),
                                    child: isSelected
                                        ? Icon(
                                            Icons.check,
                                            size: 16,
                                            color: Colors.white,
                                          )
                                        : null,
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddGuestDialog,
        icon: CustomIconWidget(
          iconName: 'person_add',
          size: 24,
          color: Colors.white,
        ),
        label: Text(
          'Add Guest',
          style: theme.textTheme.labelLarge?.copyWith(color: Colors.white),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        currentRoute: '/guest-list-management',
        onTap: (route) {
          if (route != '/guest-list-management') {
            Navigator.pushReplacementNamed(context, route);
          }
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconWidget(
              iconName: 'people_outline',
              size: 80,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 24),
            Text(
              _searchQuery.isNotEmpty ? 'No guests found' : 'No guests yet',
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _searchQuery.isNotEmpty
                  ? 'Try adjusting your search or filters'
                  : 'Start adding guests to your wedding',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterBottomSheetWidget(
        currentFilters: _activeFilters,
        onApplyFilters: (filters) {
          setState(() {
            _activeFilters = filters;
          });
        },
      ),
    );
  }

  void _showAddGuestDialog() {
    showDialog(
      context: context,
      builder: (context) => AddGuestDialogWidget(
        onAddGuest: (guest) {
          setState(() {
            _allGuests.add(guest);
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Guest added successfully'),
              backgroundColor: const Color(0xFF28A745),
            ),
          );
        },
      ),
    );
  }

  void _showGuestDetails(Map<String, dynamic> guest) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: CustomImageWidget(
                        imageUrl: guest['photo'] as String,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        semanticLabel: guest['photoSemanticLabel'] as String,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            guest['name'] as String,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            guest['relationship'] as String,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildDetailRow(
                  context,
                  'phone',
                  'Phone',
                  guest['phone'] as String,
                ),
                const SizedBox(height: 12),
                _buildDetailRow(
                  context,
                  'email',
                  'Email',
                  guest['email'] as String,
                ),
                const SizedBox(height: 12),
                _buildDetailRow(
                  context,
                  'family',
                  'Family Side',
                  guest['family'] == 'bride' ? 'Bride Family' : 'Groom Family',
                ),
                if (guest['plusOne'] == true) ...[
                  const SizedBox(height: 12),
                  _buildDetailRow(context, 'person_add', 'Plus One', 'Allowed'),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String iconName,
    String label,
    String value,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        CustomIconWidget(
          iconName: iconName,
          size: 20,
          color: colorScheme.primary,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }

  void _handleSendInvitation(Map<String, dynamic> guest) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Invitation sent to ${guest['name']}'),
        backgroundColor: const Color(0xFF50C878),
      ),
    );
  }

  void _handleMarkConfirmed(Map<String, dynamic> guest) {
    setState(() {
      guest['status'] = 'confirmed';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${guest['name']} marked as confirmed'),
        backgroundColor: const Color(0xFF28A745),
      ),
    );
  }

  void _handleAssignSeating(Map<String, dynamic> guest) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Seating assignment for ${guest['name']}')),
    );
  }

  void _handleEditGuest(Map<String, dynamic> guest) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Edit ${guest['name']}')));
  }

  void _handleRemoveGuest(Map<String, dynamic> guest) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Guest'),
        content: Text('Are you sure you want to remove ${guest['name']}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _allGuests.removeWhere((g) => g['id'] == guest['id']);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${guest['name']} removed'),
                  backgroundColor: const Color(0xFFDC3545),
                ),
              );
            },
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }

  void _handleBatchInvitation() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Invitations sent to ${_selectedGuestIds.length} guests'),
        backgroundColor: const Color(0xFF50C878),
      ),
    );
    setState(() {
      _isMultiSelectMode = false;
      _selectedGuestIds.clear();
    });
  }
}
