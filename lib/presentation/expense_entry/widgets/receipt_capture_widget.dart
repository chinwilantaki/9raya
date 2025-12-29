import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

/// Receipt capture widget with camera and gallery access
class ReceiptCaptureWidget extends StatelessWidget {
  final String? capturedImagePath;
  final Function(String?) onImageCaptured;

  const ReceiptCaptureWidget({
    super.key,
    required this.capturedImagePath,
    required this.onImageCaptured,
  });

  Future<void> _captureImage(BuildContext context, ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: source,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        onImageCaptured(image.path);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to capture image. Please try again.',
              style: Theme.of(context).snackBarTheme.contentTextStyle,
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  void _showImageSourceDialog(BuildContext context) {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      backgroundColor: theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: CustomIconWidget(
                  iconName: 'camera_alt',
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
                title: Text('Take Photo', style: theme.textTheme.bodyLarge),
                onTap: () {
                  Navigator.pop(context);
                  _captureImage(context, ImageSource.camera);
                },
              ),
              ListTile(
                leading: CustomIconWidget(
                  iconName: 'photo_library',
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
                title: Text(
                  'Choose from Gallery',
                  style: theme.textTheme.bodyLarge,
                ),
                onTap: () {
                  Navigator.pop(context);
                  _captureImage(context, ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Receipt Photo (Optional)',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        capturedImagePath != null
            ? _ImagePreview(
                imagePath: capturedImagePath!,
                onRemove: () => onImageCaptured(null),
                onReplace: () => _showImageSourceDialog(context),
              )
            : _CaptureButton(onTap: () => _showImageSourceDialog(context)),
      ],
    );
  }
}

/// Image preview with remove and replace options
class _ImagePreview extends StatelessWidget {
  final String imagePath;
  final VoidCallback onRemove;
  final VoidCallback onReplace;

  const _ImagePreview({
    required this.imagePath,
    required this.onRemove,
    required this.onReplace,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.colorScheme.outline, width: 1),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              File(imagePath),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Row(
              children: [
                _ActionButton(
                  icon: 'edit',
                  onTap: onReplace,
                  backgroundColor: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                _ActionButton(
                  icon: 'delete',
                  onTap: onRemove,
                  backgroundColor: theme.colorScheme.error,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Action button for image preview
class _ActionButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  final Color backgroundColor;

  const _ActionButton({
    required this.icon,
    required this.onTap,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          child: CustomIconWidget(
            iconName: icon,
            color: theme.colorScheme.onPrimary,
            size: 20,
          ),
        ),
      ),
    );
  }
}

/// Capture button for adding receipt photo
class _CaptureButton extends StatelessWidget {
  final VoidCallback onTap;

  const _CaptureButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          border: Border.all(
            color: theme.colorScheme.outline,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconWidget(
              iconName: 'add_a_photo',
              color: theme.colorScheme.primary,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              'Add Receipt Photo',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
