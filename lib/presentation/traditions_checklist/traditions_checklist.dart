import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_icon_widget.dart';
import './widgets/add_custom_tradition_dialog.dart';
import './widgets/tradition_section_widget.dart';
import './widgets/tradition_task_widget.dart';

/// Traditions Checklist Screen
/// Guides couples through essential Moroccan wedding customs with cultural context
class TraditionsChecklist extends StatefulWidget {
  const TraditionsChecklist({super.key});

  @override
  State<TraditionsChecklist> createState() => _TraditionsChecklistState();
}

class _TraditionsChecklistState extends State<TraditionsChecklist> {
  // Search functionality
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _isSearching = false;

  // Tradition sections data with completion tracking
  final List<Map<String, dynamic>> _traditionSections = [
    {
      "id": "pre_wedding",
      "title": "طقوس ما قبل الزفاف",
      "titleFr": "Rituels Pré-Mariage",
      "titleEn": "Pre-Wedding Rituals",
      "isExpanded": true,
      "progress": 0.4,
      "tasks": [
        {
          "id": "khitba",
          "name": "الخطبة",
          "nameFr": "Khitba (Fiançailles)",
          "nameEn": "Khitba (Engagement)",
          "isCompleted": true,
          "culturalContext":
              "Traditional engagement ceremony where families officially agree to the marriage. Includes exchange of gifts and sweets.",
          "timing": "3-6 months before wedding",
          "relatedVendors": ["Caterer", "Photographer"],
        },
        {
          "id": "henna_prep",
          "name": "تحضير حفل الحناء",
          "nameFr": "Préparation Cérémonie Henné",
          "nameEn": "Henna Ceremony Preparation",
          "isCompleted": true,
          "culturalContext":
              "Sacred pre-wedding ritual where bride receives intricate henna designs. Symbolizes beauty, joy, and protection.",
          "timing": "1-2 days before wedding",
          "relatedVendors": ["Henna Artist", "Neggafa"],
        },
        {
          "id": "hammam",
          "name": "الحمام المغربي",
          "nameFr": "Hammam Traditionnel",
          "nameEn": "Traditional Hammam",
          "isCompleted": false,
          "culturalContext":
              "Purification ritual at traditional bathhouse with family and friends. Includes body scrubbing and beauty treatments.",
          "timing": "1 week before wedding",
          "relatedVendors": ["Hammam", "Beauty Specialist"],
        },
        {
          "id": "neggafa_selection",
          "name": "اختيار النكافة",
          "nameFr": "Sélection de la Neggafa",
          "nameEn": "Neggafa Selection",
          "isCompleted": false,
          "culturalContext":
              "Choosing the traditional wedding coordinator who manages dress changes and ceremonies throughout the wedding day.",
          "timing": "2-3 months before wedding",
          "relatedVendors": ["Neggafa"],
        },
        {
          "id": "dress_fittings",
          "name": "قياس الأزياء التقليدية",
          "nameFr": "Essayages Robes Traditionnelles",
          "nameEn": "Traditional Dress Fittings",
          "isCompleted": false,
          "culturalContext":
              "Multiple fittings for the 7 traditional Moroccan wedding dresses (caftans) representing different regions.",
          "timing": "1-2 months before wedding",
          "relatedVendors": ["Dress Designer", "Neggafa"],
        },
      ],
    },
    {
      "id": "wedding_day",
      "title": "طقوس يوم الزفاف",
      "titleFr": "Rituels Jour du Mariage",
      "titleEn": "Wedding Day Customs",
      "isExpanded": false,
      "progress": 0.2,
      "tasks": [
        {
          "id": "neggafa_prep",
          "name": "تحضير النكافة",
          "nameFr": "Préparation avec Neggafa",
          "nameEn": "Neggafa Preparation",
          "isCompleted": true,
          "culturalContext":
              "Neggafa helps bride prepare and manages the ceremonial dress changes throughout the day.",
          "timing": "Morning of wedding",
          "relatedVendors": ["Neggafa", "Makeup Artist"],
        },
        {
          "id": "nikah",
          "name": "عقد القران",
          "nameFr": "Nikah (Contrat Mariage)",
          "nameEn": "Nikah (Marriage Contract)",
          "isCompleted": false,
          "culturalContext":
              "Islamic marriage contract signing ceremony with witnesses and religious officiant.",
          "timing": "Afternoon",
          "relatedVendors": ["Religious Officiant"],
        },
        {
          "id": "zaffa",
          "name": "الزفة",
          "nameFr": "Zaffa (Procession)",
          "nameEn": "Zaffa Procession",
          "isCompleted": false,
          "culturalContext":
              "Grand entrance procession with traditional music, dancers, and celebration as couple enters reception.",
          "timing": "Evening entrance",
          "relatedVendors": ["Band", "Dancers", "Photographer"],
        },
        {
          "id": "amariya",
          "name": "العمارية",
          "nameFr": "Amariya (Trône)",
          "nameEn": "Amariya Throne",
          "isCompleted": false,
          "culturalContext":
              "Bride and groom carried on ornate throne-like platform by family members in ceremonial procession.",
          "timing": "During reception",
          "relatedVendors": ["Amariya Rental", "Decorators"],
        },
        {
          "id": "seven_dresses",
          "name": "الأزياء السبعة",
          "nameFr": "Sept Robes Traditionnelles",
          "nameEn": "Seven Traditional Dresses",
          "isCompleted": false,
          "culturalContext":
              "Bride changes into 7 different traditional caftans representing various Moroccan regions throughout the celebration.",
          "timing": "Throughout evening",
          "relatedVendors": ["Neggafa", "Dress Designer"],
        },
      ],
    },
    {
      "id": "post_wedding",
      "title": "طقوس ما بعد الزفاف",
      "titleFr": "Rituels Post-Mariage",
      "titleEn": "Post-Wedding Traditions",
      "isExpanded": false,
      "progress": 0.0,
      "tasks": [
        {
          "id": "sabah",
          "name": "صباحية",
          "nameFr": "Sabah (Lendemain)",
          "nameEn": "Sabah Morning After",
          "isCompleted": false,
          "culturalContext":
              "Day-after celebration with close family and friends, featuring traditional breakfast and gift exchanges.",
          "timing": "Day after wedding",
          "relatedVendors": ["Caterer"],
        },
        {
          "id": "family_visits",
          "name": "زيارات العائلة",
          "nameFr": "Visites Familiales",
          "nameEn": "Family Visits",
          "isCompleted": false,
          "culturalContext":
              "Newlyweds visit both families to receive blessings and gifts in the weeks following the wedding.",
          "timing": "1-2 weeks after wedding",
          "relatedVendors": [],
        },
        {
          "id": "thank_you_gifts",
          "name": "هدايا الشكر",
          "nameFr": "Cadeaux de Remerciement",
          "nameEn": "Thank You Gifts",
          "isCompleted": false,
          "culturalContext":
              "Distribution of thank you gifts to guests and family members who contributed to the wedding celebration.",
          "timing": "2-4 weeks after wedding",
          "relatedVendors": [],
        },
      ],
    },
  ];

  // Custom traditions added by users
  final List<Map<String, dynamic>> _customTraditions = [];

  // Reorder mode
  bool _isReorderMode = false;
  String? _selectedSectionForReorder;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
    });
  }

  // Toggle task completion
  void _toggleTaskCompletion(String sectionId, String taskId) {
    setState(() {
      final section = _traditionSections.firstWhere(
        (s) => s['id'] == sectionId,
      );
      final task = (section['tasks'] as List).firstWhere(
        (t) => t['id'] == taskId,
      );
      task['isCompleted'] = !task['isCompleted'];

      // Update section progress
      final tasks = section['tasks'] as List;
      final completedCount = tasks
          .where((t) => t['isCompleted'] == true)
          .length;
      section['progress'] = completedCount / tasks.length;
    });

    // Show undo snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Task marked as completed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () => _toggleTaskCompletion(sectionId, taskId),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // Toggle section expansion
  void _toggleSectionExpansion(String sectionId) {
    setState(() {
      final section = _traditionSections.firstWhere(
        (s) => s['id'] == sectionId,
      );
      section['isExpanded'] = !section['isExpanded'];
    });
  }

  // Show task details dialog
  void _showTaskDetails(Map<String, dynamic> task) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(task['nameEn'], style: theme.textTheme.titleLarge),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Cultural Context',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              SizedBox(height: 1.h),
              Text(task['culturalContext'], style: theme.textTheme.bodyMedium),
              SizedBox(height: 2.h),
              Text(
                'Recommended Timing',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              SizedBox(height: 1.h),
              Text(task['timing'], style: theme.textTheme.bodyMedium),
              if ((task['relatedVendors'] as List).isNotEmpty) ...[
                SizedBox(height: 2.h),
                Text(
                  'Related Vendors',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
                SizedBox(height: 1.h),
                Wrap(
                  spacing: 1.w,
                  runSpacing: 1.h,
                  children: (task['relatedVendors'] as List).map((vendor) {
                    return Chip(
                      label: Text(vendor),
                      backgroundColor: theme.colorScheme.primaryContainer,
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  // Add custom tradition
  void _showAddCustomTraditionDialog() {
    showDialog(
      context: context,
      builder: (context) => AddCustomTraditionDialog(
        onAdd: (tradition) {
          setState(() {
            _customTraditions.add(tradition);
          });
        },
      ),
    );
  }

  // Delete custom tradition
  void _deleteCustomTradition(int index) {
    setState(() {
      _customTraditions.removeAt(index);
    });
  }

  // Toggle reorder mode
  void _toggleReorderMode(String? sectionId) {
    setState(() {
      _isReorderMode = !_isReorderMode;
      _selectedSectionForReorder = sectionId;
    });
  }

  // Reorder tasks
  void _reorderTasks(String sectionId, int oldIndex, int newIndex) {
    setState(() {
      final section = _traditionSections.firstWhere(
        (s) => s['id'] == sectionId,
      );
      final tasks = section['tasks'] as List;

      if (newIndex > oldIndex) {
        newIndex -= 1;
      }

      final task = tasks.removeAt(oldIndex);
      tasks.insert(newIndex, task);
    });
  }

  // Filter sections based on search query
  List<Map<String, dynamic>> _getFilteredSections() {
    if (_searchQuery.isEmpty) {
      return _traditionSections;
    }

    return _traditionSections
        .map((section) {
          final tasks = (section['tasks'] as List).where((task) {
            return task['nameEn'].toLowerCase().contains(_searchQuery) ||
                task['nameFr'].toLowerCase().contains(_searchQuery) ||
                task['culturalContext'].toLowerCase().contains(_searchQuery);
          }).toList();

          return {...section, 'tasks': tasks};
        })
        .where((section) => (section['tasks'] as List).isNotEmpty)
        .toList();
  }

  // Calculate overall progress
  double _calculateOverallProgress() {
    int totalTasks = 0;
    int completedTasks = 0;

    for (var section in _traditionSections) {
      final tasks = section['tasks'] as List;
      totalTasks += tasks.length;
      completedTasks += tasks.where((t) => t['isCompleted'] == true).length;
    }

    return totalTasks > 0 ? completedTasks / totalTasks : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filteredSections = _getFilteredSections();
    final overallProgress = _calculateOverallProgress();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: _isSearching
          ? CustomAppBar.search(
              onSearchSubmitted: (query) {
                setState(() {
                  _searchQuery = query.toLowerCase();
                });
              },
              onBackPressed: () {
                setState(() {
                  _isSearching = false;
                  _searchQuery = '';
                  _searchController.clear();
                });
              },
            )
          : CustomAppBar.standard(
              title: 'Traditions Checklist',
              actions: [
                CustomAppBarAction(
                  icon: Icons.search,
                  onPressed: () {
                    setState(() {
                      _isSearching = true;
                    });
                  },
                  tooltip: 'Search traditions',
                ),
                CustomAppBarAction(
                  icon: Icons.share,
                  onPressed: () {
                    // Share functionality for family coordination
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Sharing checklist with family...'),
                      ),
                    );
                  },
                  tooltip: 'Share checklist',
                ),
              ],
            ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Simulate sync with family members
          await Future.delayed(const Duration(seconds: 1));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Checklist synced successfully')),
          );
        },
        child: CustomScrollView(
          slivers: [
            // Overall progress header
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(4.w),
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.shadow.withValues(alpha: 0.08),
                      offset: const Offset(0, 2),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overall Progress',
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: overallProgress,
                              minHeight: 1.h,
                              backgroundColor: theme.colorScheme.outline
                                  .withValues(alpha: 0.2),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          '${(overallProgress * 100).toInt()}%',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Tradition sections
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final section = filteredSections[index];
                return TraditionSectionWidget(
                  section: section,
                  isReorderMode:
                      _isReorderMode &&
                      _selectedSectionForReorder == section['id'],
                  onToggleExpansion: () =>
                      _toggleSectionExpansion(section['id']),
                  onToggleReorderMode: () => _toggleReorderMode(section['id']),
                  onReorderTasks: (oldIndex, newIndex) =>
                      _reorderTasks(section['id'], oldIndex, newIndex),
                  taskWidgets: (section['tasks'] as List).map((task) {
                    return TraditionTaskWidget(
                      task: task,
                      sectionId: section['id'],
                      onToggleCompletion: () =>
                          _toggleTaskCompletion(section['id'], task['id']),
                      onShowDetails: () => _showTaskDetails(task),
                    );
                  }).toList(),
                );
              }, childCount: filteredSections.length),
            ),

            // Custom traditions section
            if (_customTraditions.isNotEmpty)
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Custom Family Traditions',
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      ..._customTraditions.asMap().entries.map((entry) {
                        final index = entry.key;
                        final tradition = entry.value;
                        return Card(
                          margin: EdgeInsets.only(bottom: 2.h),
                          child: ListTile(
                            title: Text(tradition['name']),
                            subtitle: Text(tradition['description']),
                            trailing: IconButton(
                              icon: CustomIconWidget(
                                iconName: 'delete',
                                color: theme.colorScheme.error,
                                size: 24,
                              ),
                              onPressed: () => _deleteCustomTradition(index),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),

            // Bottom spacing
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddCustomTraditionDialog,
        icon: CustomIconWidget(
          iconName: 'add',
          color: theme.colorScheme.onSecondary,
          size: 24,
        ),
        label: const Text('Add Custom'),
      ),
      bottomNavigationBar: const CustomBottomBar(
        currentRoute: '/traditions-checklist',
      ),
    );
  }
}
