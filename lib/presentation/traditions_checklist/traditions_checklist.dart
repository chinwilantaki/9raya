import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import '../../data/wedding_traditions_data.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/country_provider.dart';
import '../../providers/locale_provider.dart';
import '../../routes/app_routes.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_icon_widget.dart';
import './widgets/add_custom_tradition_dialog.dart';
import './widgets/tradition_section_widget.dart';
import './widgets/tradition_task_widget.dart';

/// Traditions Checklist Screen
/// Guides couples through essential wedding customs with cultural context based on selected country
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

  // Tradition sections data with completion tracking - loaded dynamically
  List<Map<String, dynamic>> _traditionSections = [];

  // Custom traditions added by users
  final List<Map<String, dynamic>> _customTraditions = [];

  // Reorder mode
  bool _isReorderMode = false;
  String? _selectedSectionForReorder;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _loadTraditions();
  }

  // Track current country to detect changes
  String? _currentCountryCode;

  // Helper method to get task name based on language
  String _getTaskName(Map<String, dynamic> task, String languageCode) {
    switch (languageCode) {
      case 'fr':
        return task['nameFr'] ?? task['nameEn'] ?? '';
      case 'ar':
        return task['name'] ?? task['nameEn'] ?? '';
      default:
        return task['nameEn'] ?? '';
    }
  }

  // Load traditions based on selected country
  void _loadTraditions() {
    if (!mounted) return;
    
    final countryProvider = Provider.of<CountryProvider>(context, listen: false);
    final countryCode = countryProvider.selectedCountry;
    
    // Only reload if country changed
    if (_currentCountryCode == countryCode && _traditionSections.isNotEmpty) {
      return;
    }
    
    _currentCountryCode = countryCode;
    final traditions = WeddingTraditionsData.getTraditionsForCountry(countryCode);

    if (mounted) {
      setState(() {
        _traditionSections = traditions.map((section) {
          // Initialize tasks with completion status from SharedPreferences if needed
          final tasks = (section['tasks'] as List).map((task) {
            return {
              ...task,
              'isCompleted': task['isCompleted'] ?? false,
            };
          }).toList();

          // Calculate progress
          final completedCount =
              tasks.where((t) => t['isCompleted'] == true).length;
          final progress = tasks.isEmpty ? 0.0 : completedCount / tasks.length;

          return {
            ...section,
            'isExpanded': section['id'] == 'pre_wedding', // Expand first section by default
            'progress': progress,
            'tasks': tasks,
          };
        }).toList();
      });
    }
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
    final appLocalizations = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(appLocalizations?.traditionsChecklist_taskMarkedAsCompleted ?? 'Task marked as completed'),
        action: SnackBarAction(
          label: appLocalizations?.traditionsChecklist_undo ?? 'Undo',
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
        title: Text(_getTaskName(task, localeProvider.locale.languageCode), style: theme.textTheme.titleLarge),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)?.traditionsChecklist_culturalContext ?? 'Cultural Context',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              SizedBox(height: 1.h),
              Text(task['culturalContext'], style: theme.textTheme.bodyMedium),
              SizedBox(height: 2.h),
              Text(
                AppLocalizations.of(context)?.traditionsChecklist_recommendedTiming ?? 'Recommended Timing',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              SizedBox(height: 1.h),
              Text(task['timing'], style: theme.textTheme.bodyMedium),
              if ((task['relatedVendors'] as List).isNotEmpty) ...[
                SizedBox(height: 2.h),
                Text(
                  AppLocalizations.of(context)?.traditionsChecklist_relatedVendors ?? 'Related Vendors',
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
            child: Text(AppLocalizations.of(context)?.traditionsChecklist_close ?? 'Close'),
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
    final localeProvider = Provider.of<LocaleProvider>(context);
    final currentLocale = localeProvider.locale.languageCode;
    final filteredSections = _getFilteredSections();
    final overallProgress = _calculateOverallProgress();

    return Consumer<CountryProvider>(
      builder: (context, countryProvider, child) {
        // Get country name for display
        String countryName = WeddingTraditionsData.getCountryName(
          countryProvider.selectedCountry,
          currentLocale,
        );
        final countries = WeddingTraditionsData.getAvailableCountries();
        final selectedCountryData = countries.firstWhere(
          (c) => c['code'] == countryProvider.selectedCountry,
          orElse: () => countries[0],
        );

        // Check if country changed and reload traditions
        if (_currentCountryCode != countryProvider.selectedCountry) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _loadTraditions();
          });
        }

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
              title: AppLocalizations.of(context)?.traditionsChecklist_traditionsChecklist ?? 'Traditions Checklist',
              actions: [
                // Language selector button
                CustomAppBarAction(
                  icon: Icons.language,
                  onPressed: () async {
                    await Navigator.pushNamed(
                      context,
                      AppRoutes.languageSelection,
                    );
                  },
                  tooltip: AppLocalizations.of(context)?.languageSelection_selectLanguage ?? 'Select Language',
                ),
                // Country selector button
                CustomAppBarAction(
                  icon: Icons.public,
                  onPressed: () async {
                    await Navigator.pushNamed(
                      context,
                      AppRoutes.countrySelection,
                    );
                    // Reload traditions when returning from country selection
                    _loadTraditions();
                  },
                  tooltip: AppLocalizations.of(context)?.countrySelection_changeCountry ?? 'Change Country',
                ),
                CustomAppBarAction(
                  icon: Icons.search,
                  onPressed: () {
                    setState(() {
                      _isSearching = true;
                    });
                  },
                  tooltip: AppLocalizations.of(context)?.traditionsChecklist_searchTraditions ?? 'Search traditions',
                ),
                CustomAppBarAction(
                  icon: Icons.share,
                  onPressed: () {
                    // Share functionality for family coordination
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(AppLocalizations.of(context)?.traditionsChecklist_sharingChecklistWithFamily ?? 'Sharing checklist with family...'),
                      ),
                    );
                  },
                  tooltip: AppLocalizations.of(context)?.traditionsChecklist_shareChecklist ?? 'Share checklist',
                ),
              ],
            ),
          body: RefreshIndicator(
        onRefresh: () async {
          // Simulate sync with family members
          await Future.delayed(const Duration(seconds: 1));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalizations.of(context)?.traditionsChecklist_checklistSyncedSuccessfully ?? 'Checklist synced successfully'),
            ),
          );
        },
        child: CustomScrollView(
          slivers: [
            // Country indicator and overall progress header
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
                    // Country indicator
                    Row(
                      children: [
                        Text(
                          selectedCountryData['flag'] ?? '🌍',
                          style: TextStyle(fontSize: 5.w),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Text(
                            countryName,
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () async {
                            await Navigator.pushNamed(
                              context,
                              AppRoutes.countrySelection,
                            );
                            _loadTraditions();
                          },
                          icon: Icon(
                            Icons.edit,
                            size: 4.w,
                          ),
                          label: Text(
                            AppLocalizations.of(context)?.common_change ?? 'Change',
                            style: TextStyle(fontSize: 3.w),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Divider(),
                    SizedBox(height: 2.h),
                    Text(
                      AppLocalizations.of(context)?.traditionsChecklist_overallProgress ?? 'Overall Progress',
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
                        AppLocalizations.of(context)?.traditionsChecklist_customFamilyTraditions ?? 'Custom Family Traditions',
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
        label: Text(AppLocalizations.of(context)?.traditionsChecklist_addCustom ?? 'Add Custom'),
      ),
        bottomNavigationBar: const CustomBottomBar(
          currentRoute: '/traditions-checklist',
        ),
      );
    },
    );
  }
}
